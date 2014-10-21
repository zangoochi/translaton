from django.db import models
from django.contrib.auth.models import User

class Language(models.Model):
	language = models.CharField(max_length=3)
	displayName = models.CharField(max_length=50)
	
	def __unicode__(self):
		return self.language

#eventually, link this up to the django user table
class Grader(models.Model):
	graderID = models.CharField(max_length=3)
	firstName = models.CharField(max_length=32)
	lastName = models.CharField(max_length=32)
	language1 = models.ForeignKey(Language, related_name='+')
	language2 = models.ForeignKey(Language, related_name='+')
	language3 = models.ForeignKey(Language, related_name='+')

	def __unicode__(self):
		return "{0} - {1}".format(self.graderID, self.lastName)
	
class ErrorCode(models.Model):
	errorCode = models.CharField(max_length=3)
	displayName = models.CharField(max_length=250)
	displayColor = models.CharField(max_length=25)
	
	def __unicode__(self):
		return self.displayName
	
class Error(models.Model):
	NORMAL_ERROR = "NORMAL_ERROR"
	DISJUNCT_ERROR = "DISJUNCT_ERROR"
	ERROR_TYPE_CHOICES = (
		(NORMAL_ERROR, "NORMAL_ERROR"),
		(DISJUNCT_ERROR, "DISJUNCT_ERROR"),
	)

	exam     = models.ForeignKey("Exam")
	passageLetter  = models.CharField(max_length=1)
	errorNumber = models.PositiveSmallIntegerField() #this is only unique PER EXAM AND PASSAGE LETTER
	errorCode = models.ForeignKey(ErrorCode)
	pointsDeducted = models.PositiveSmallIntegerField()
	sourcePhrase  = models.CharField(max_length=255)
	targetPhrase  = models.CharField(max_length=255)
	sourceJSON    = models.CharField(max_length=512)
	targetJSON    = models.CharField(max_length=512)
	comment       = models.TextField()
	errorType     = models.CharField(choices=ERROR_TYPE_CHOICES, max_length=32)

	def as_json(self):
		return dict(

			id = self.pk,
			passageLetter = self.passageLetter,
			errorCode = self.errorCode.errorCode,
			pointsDeducted = self.pointsDeducted, 
			sourcePhrase = self.sourcePhrase, 
			targetPhrase = self.targetPhrase, 
			sourceJSON   = self.sourceJSON,
			targetJSON   = self.targetJSON,
			comment = self.comment,
			errorNumber = self.errorNumber,
			errorType   = self.errorType
		)

#the '+' on the related name makes it so django doesn't make a backwards relation
class SourceText(models.Model):
	sourceLanguage = models.ForeignKey(Language, related_name='+')
	targetLanguage = models.ForeignKey(Language, related_name='+')
	year		   = models.PositiveSmallIntegerField()
	setNumber      = models.PositiveSmallIntegerField()
	passageLetter  = models.CharField(max_length=1)
	versionNumber  = models.PositiveSmallIntegerField()
	text           = models.TextField()
	importer1      = models.ForeignKey(User, related_name='+')

	# importer2 needs to be set to null currently in order to 
	importer2      = models.ForeignKey(User, null=True, related_name='+')

	def isLocked():
		return importer1 is not None and importer2 is not None

	# compares SourceText to review form data to see if any changes/corrections 
	# were made during the review. returns False if any field is changed true otherwise
	def equalToPost(self, postData):
		if (self.sourceLanguage.language != postData['sourceLanguage'] or
			self.targetLanguage.language != postData['targetLanguage'] or
			self.year != int(postData["year"]) or
			self.setNumber != int(postData["setNumber"]) or
		   	self.passageLetter != postData["passageLetter"] or
		   	self.versionNumber != int(postData["versionNumber"]) or
		   	self.text != postData['sourcePassage']):
			return False
		else:
			return True

	# used to set the sourceText values when changed by a reviewer making corrections.
	# sets sourceText to post data review form.
	def setToPost(self, newSource):
		if(self.sourceLanguage.language != newSource['sourceLanguage']):
			self.sourceLanguage.language = newSource['sourceLanguage']
		if(self.targetLanguage.language != newSource['targetLanguage']):
			self.targetLanguage.language = newSource['targetLanguage']
		if(self.year != int(newSource["year"])):
			self.year = int(newSource["year"])
		if(self.setNumber != int(newSource["setNumber"])):
			self.setNumber = int(newSource["setNumber"])
		if(self.passageLetter != newSource["passageLetter"]):
			self.passageLetter = newSource["passageLetter"]
		if(self.versionNumber != int(newSource["versionNumber"])):
			self.versionNumber = int(newSource["versionNumber"])
		if(self.text != newSource['sourcePassage']):
			self.text = newSource['sourcePassage']
	
	def setToOtherSource(self, newSource):
		if(self.sourceLanguage.language != newSource.sourceLanguage):
			self.sourceLanguage.language = newSource.sourceLanguage
		if(self.targetLanguage.language != newSource.targetLanguage):
			self.targetLanguage.language = newSource.targetLanguage
		if(self.year != newSource.year):
			self.year = newSource.year
		if(self.setNumber != newSource.setNumber):
			self.setNumber = newSource.setNumber
		if(self.passageLetter != newSource.passageLetter):
			self.passageLetter = newSource.passageLetter
		if(self.versionNumber != newSource.versionNumber):
			self.versionNumber = newSource.versionNumber
		if(self.text != newSource.text):
			self.text = newSource.text

	def __unicode__(self):
		return "{0}_{1}_{2}_{3}_{4}_{5}".format(self.sourceLanguage.language,
												self.targetLanguage.language,
												self.year, 
												self.setNumber,
												self.passageLetter,
												self.versionNumber)

# if anyone needs to know about model.Managers use the django link below
# https://docs.djangoproject.com/en/1.6/topics/db/managers/
class sourceQueueManager(models.Manager):
	def getQueue(self, user):
		from userprofile.models import LanguagePair
		userLangs = LanguagePair.objects.filter(user = user).values('language')
		return self.filter(source__importer2 = None,
						   source__sourceLanguage__in = userLangs).exclude(source__importer1 = user)

class sourceReviewQueue(models.Model):
	source = models.OneToOneField(SourceText)
	objects = sourceQueueManager()

# this class could and should prob be set up as a multi-table inheritance model to cut down on redundant code
# https://docs.djangoproject.com/en/dev/topics/db/models/#model-inheritance
class sourceDiscrepancyQueue(models.Model):
	importer1 = models.ForeignKey(User, related_name='+')
	importer2 = models.ForeignKey(User, related_name='+')
	needsToReview = models.ForeignKey(User, null=True, related_name='+')
	originalSource = models.OneToOneField(SourceText)
	# temp storage for proposed changes to source text during review
	sourceLanguage  = models.ForeignKey(Language, related_name='+')
	targetLanguage  = models.ForeignKey(Language, related_name='+')
	year		    = models.PositiveSmallIntegerField()
	setNumber       = models.PositiveSmallIntegerField()
	passageLetter   = models.CharField(max_length=1)
	versionNumber   = models.PositiveSmallIntegerField()
	text            = models.TextField()

	# used to set the sourceText values when changed by a reviewer making corrections.
	# sets sourceText to post data review form.
	def setToPost(self, newSource):
		if(self.sourceLanguage != newSource['sourceLanguage']):
			self.sourceLanguage.language = newSource['sourceLanguage']
		if(self.targetLanguage.language != newSource['targetLanguage']):
			self.targetLanguage.language = newSource['targetLanguage']
		if(self.year != int(newSource["year"])):
			self.year = int(newSource["year"])
		if(self.setNumber != int(newSource["setNumber"])):
			self.setNumber = int(newSource["setNumber"])
		if(self.passageLetter != newSource["passageLetter"]):
			self.passageLetter = newSource["passageLetter"]
		if(self.versionNumber != int(newSource["versionNumber"])):
			self.versionNumber = int(newSource["versionNumber"])
		if(self.text != newSource['sourcePassage']):
			self.text = newSource['sourcePassage']

	# my reason for putting these row level methods in the class
	# https://docs.djangoproject.com/en/1.6/topics/db/models/#model-methods
	def otherImporter(self, user):
		if self.importer1 == user:
			return self.importer2
		else:
			return self.importer1	

	# compares SourceText to review form data to see if any changes/corrections 
	# were made during the review. returns False if any field is changed true otherwise
	def equalToPost(self, postData):
		if (self.sourceLanguage.language != postData['sourceLanguage'] or
			self.targetLanguage.language != postData['targetLanguage'] or
			self.year != int(postData["year"]) or
			self.setNumber != int(postData["setNumber"]) or
		   	self.passageLetter != postData["passageLetter"] or
		   	self.versionNumber != int(postData["versionNumber"]) or
		   	self.text != postData['sourcePassage']):
			return False
		else:
			return True
		

class TargetText(models.Model):
	text           = models.TextField()
	language       = models.ForeignKey(Language)
	g1ErrorScore   = models.PositiveSmallIntegerField(null=True)
	g2ErrorScore   = models.PositiveSmallIntegerField(null=True)
	g3ErrorScore   = models.PositiveSmallIntegerField(null=True)
	g4ErrorScore   = models.PositiveSmallIntegerField(null=True)
	errorStop      = models.BooleanField(default=False)
	notGraded      = models.BooleanField(default=False)
	incomplete     = models.BooleanField(default=False)
	qualityPoints  = models.PositiveSmallIntegerField(null=True)
	passageReviewed= models.BooleanField(default=False)
	pdfURI         = models.CharField(max_length=255)
	doneGrading       = models.BooleanField(default=False)


	#importers must be set to allow null untill we find out how review flow will take place
	importer1      = models.ForeignKey(User, related_name='+')
	importer2      = models.ForeignKey(User, related_name='+', null=True)
	
	def isLocked():
		return importer1 is not None and importer2 is not None


		
	def __unicode__(self):
		return "TARGET TEXT {0} {1}".format(self.pk, self.pdfURI)

		
class Exam(models.Model):
	examNumber = models.CharField(max_length=5)
	secondPassage = models.CharField(max_length=1)
	aPassageMarkings = models.BooleanField()
	secondPassageMarkings = models.BooleanField()
	grader1 = models.PositiveSmallIntegerField()
	grader2 = models.PositiveSmallIntegerField()
	grader3 = models.PositiveSmallIntegerField()
	grader4 = models.PositiveSmallIntegerField()
	sourceText1 = models.ForeignKey(SourceText, related_name='+')
	sourceText2 = models.ForeignKey(SourceText, related_name='+')
	targetText1 = models.ForeignKey(TargetText, related_name='+', null=True)
	targetText2 = models.ForeignKey(TargetText, related_name='+', null=True)
	sourceLanguage    = models.ForeignKey(Language, related_name='+')
	targetLanguage    = models.ForeignKey(Language, related_name='+')

	def getPDFURI(self):
		return "{0}.pdf".format(self.examNumber)

	def __unicode__(self):
		return "EXAM # {0}".format(self.examNumber)
	
class GraderQueue(models.Model):
	exam = models.ForeignKey("Exam")
	passageLetter = models.CharField(max_length = 1)

class TargetReviewQueue(models.Model):
	exam         = models.ForeignKey(Exam, related_name='+')
	targetText   = models.OneToOneField(TargetText)
	nextReviewer = models.ForeignKey(User, related_name='+', null=True)

class TargetInputQueue(models.Model):
	exam         = models.ForeignKey(Exam, related_name='+')
	targetTextNumber = models.PositiveSmallIntegerField()

class Discrepancy(models.Model):
	text         = models.ForeignKey(TargetText)
	modifiedText = models.TextField()
	user         = models.ForeignKey(User)
	numTimesVerified = models.PositiveSmallIntegerField()

class ErrorJSON(models.Model):
	exam       = models.ForeignKey(Exam, related_name='+')
	passageLetter = models.CharField(max_length = 1)
	targetJSON = models.TextField()
	sourceJSON = models.TextField()
	
#########################################################################################
##  Helper Methods for creating objects that are used often	--- should move to another class eventually

def addExamToGraderQueue(exam, passageLetter):
	queueObject = GraderQueue(exam = Exam.objects.get(pk = exam.pk), passageLetter = passageLetter)
	queueObject.save()

def removeExamFromGraderQueue(exam):
	queueObject = GraderQueue.objects.get(exam = exam.pk)
	queueObject.delete()	

def addTargetTextToInputQueue(exam, targetTextNumber):
	queueObject = TargetInputQueue(exam = Exam.objects.get(pk = exam.pk), targetTextNumber = targetTextNumber)
	queueObject.save()

def removeTargetTextFromInputQueue(exam, targetTextNumber):
	queueObject = TargetInputQueue.objects.get(exam = exam.pk, targetTextNumber = targetTextNumber)
	queueObject.delete()

def addTargetTextToReviewQueue(targetText, exam):
	queueObject = TargetReviewQueue(targetText = TargetText.objects.get(pk = targetText.pk),
									exam       = Exam.objects.get(pk = exam.pk	          ))
	queueObject.save()
	
def removeTargetTextFromReviewQueue(targetText):
	queueObject = TargetReviewQueue.objects.get(targetText = targetText.pk)
	queueObject.delete()

def createErrorFromPostData(postData):
	#this seems like a good place to be sanitizing our input
	examID                = postData["examID"]
	passageLetter         = postData["passageLetter"]
	errorCode             = postData["errorCode"]
	pointsDeducted        = postData["pointsDeducted"]
	sourcePhrase          = postData["sourcePhrase"]
	targetPhrase          = postData["targetPhrase"]
	comment               = postData["comment"]
	sourceJSON            = postData["sourceJSON"]
	targetJSON            = postData["targetJSON"]
	errorNumber           = postData["errorNumber"]
	errorType             = postData["errorType"]

	error = Error(exam                  = Exam.objects.get(examNumber = examID),
				  passageLetter         = passageLetter,	
				  errorCode             = ErrorCode.objects.get(errorCode = errorCode),
				  pointsDeducted        = pointsDeducted,
				  sourcePhrase          = sourcePhrase,
				  targetPhrase          = targetPhrase,
				  comment               = comment,
				  errorNumber           = errorNumber,
				  sourceJSON            = sourceJSON,
				  targetJSON            = targetJSON,
				  errorType             = errorType)
	
	return error

def editErrorFromPutData(error, putData):
	error.errorCode             = ErrorCode.objects.get(errorCode = putData["errorCode"])
	error.pointsDeducted        = putData["pointsDeducted"]
	error.sourcePhrase          = putData["sourcePhrase"]
	error.targetPhrase          = putData["targetPhrase"]
	error.comment               = putData["comment"]

	error.save()
