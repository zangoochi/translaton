from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class ErrorCode(models.Model):
	errorCode      = models.CharField(max_length=3)
	displayName    = models.CharField(max_length=250)
	displayColor   = models.CharField(max_length=25)
 	
	def __unicode__(self):
		return self.displayName

class Error(models.Model):
	exam           = models.ForeignKey('exams.Exam')
	passageLetter  = models.CharField(max_length=1)
	grader         = models.ForeignKey(User)
	errorCode      = models.ForeignKey(ErrorCode)
	gradingSession = models.PositiveSmallIntegerField()
	errorValue     = models.PositiveSmallIntegerField()
	comment        = models.TextField()
 
class GraderQueue(models.Model):
	exam           = models.ForeignKey('exams.Exam')
	passageLetter  = models.CharField(max_length = 1)

class ErrorIndexes(models.Model):
	error = models.ForeignKey(Error)
	isSourceText   = models.BooleanField()
	beginIndex     = models.PositiveIntegerField()
	endIndex       = models.PositiveIntegerField()