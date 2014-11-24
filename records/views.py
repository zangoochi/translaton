#=====================================================================================================
#Description:
#Views for exams. This is the logic behind entering new exams, and the data input for those exams. 
#=====================================================================================================

#Edited by: Zach Montgomery
#Date:10/20/14
#Contact Info: zmontgom@kent.edu
#Changes made: In enter exam record, removed where the exam was being passed to another importer. 
#					This removes the functionality of reviewing exam input data, but gets us down to 
#					a functioning project where this functionality can then be build off of. Also commented
#					out the view for verifying exam records. Since we are removing the functionality of reviewing 
#					the exams, this part will not be needed. 

#Changes made: Check that both target texts for the exam are submitted. Once both parts are submitted
#					then send both parts to the graderExamInput queue to be graded. 
#Date:11/11/14
#Contact Info: zmontgom@kent.edu
#Changes made: Added variable graderLang to pass to template that allows us to gather all graders and their 
#				languages as Key:Value pairs.
#=====================================================================================================


from django.http import HttpResponse, HttpResponseRedirect
from django import template
from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth.models import User, Group
from texts.models import Exam, SourceText, addTargetTextToReviewQueue, removeTargetTextFromReviewQueue, TargetText, addTargetTextToInputQueue, removeTargetTextFromInputQueue
from texts.models import addExamToGraderQueue, Discrepancy, Language, Grader
from records.models import Record
from records.forms import NewExamForm
from texts.forms import TextReviewForm
from userprofile.models import LanguagePair
import json


import os, imp
from django.conf import settings
from django.core.files import File
FILE_UPLOAD_DIR = os.path.join(settings.BASE_DIR, 'static','pdf')


#1rst following view def will be deleted once login and session is in place
def index(request):
	return render(request, 'records/index.html', {})

#enter a new target text into the DB
def enterExamRecord(request, examNumber="1", passageNumber="1"):
	exam = Exam.objects.get(examNumber = examNumber)
	#add new target text to the exam and database / review the old one
	if request.method == 'POST':	
		postData = request.POST
		newTargetText = TargetText(text      = postData["text"], 
								   language  = Language.objects.get(language = postData["targetLanguage"]),
								   importer1 = User.objects.get(username = request.user.username))
		newTargetText.save()
		
		if passageNumber == "1":
			exam.targetText1 = newTargetText
		else:
			exam.targetText2 = newTargetText
		
		exam.save()

#=====================================================================================================
		#This part commented out would be used to send the new exam 
		#to the exam review queue. This part would be for the second 
		#importer to review the target text to verify that it is correct. 
#=====================================================================================================

		#addTargetTextToReviewQueue(newTargetText, exam)


		removeTargetTextFromInputQueue(exam, int(passageNumber))


		#Adds the exam to the grader queue once the targetText1 and targetText2 are both submitted
		if exam.targetText1 is not None and exam.targetText2 is not None:
			addExamToGraderQueue(exam, 'A')
			addExamToGraderQueue(exam, exam.secondPassage)
	

		return redirect("/{0}/".format(request.user.username))
			
	#render the add new target text form
	else:		
		return render(request, 'records/enter_exam_record.html', {'exam': exam, 'passageNumber' : passageNumber})


#Zach Montgomery: edited in iteration 2 week 4
#enter a new exam into the database
def enterNewExam(request):
	if request.method == 'POST':
		form = NewExamForm(request.POST)
		#Checks to determine if the form input is valid. 
		if form.is_valid():
			newExam = Exam(examNumber            = form.cleaned_data["examNumber"],
					   	   secondPassage         = form.cleaned_data["secondPassage"],
					   	   aPassageMarkings      = False, 
					       secondPassageMarkings = False,
					       grader1               = form.cleaned_data["grader1"],
					       grader2               = form.cleaned_data["grader2"],
					       grader3               = form.cleaned_data["grader3"],
					       grader4               = form.cleaned_data["grader4"],
					       sourceText1           = SourceText.objects.all().get(pk = form.cleaned_data["sourceText1"]),
					       sourceText2           = SourceText.objects.all().get(pk = form.cleaned_data["sourceText2"]),
					       sourceLanguage        = Language.objects.all().get(language = form.cleaned_data["sourceLanguage"]),
					       targetLanguage        = Language.objects.all().get(language = form.cleaned_data["targetLanguage"]))
            
			if(newExam.grader1 != newExam.grader2):  
				if(newExam.grader3 == ""):
					newExam.grader3 = None

				if(newExam.grader4 == ""):
					newExam.grader4 = None
				newExam.save()
			else:
				group = Group.objects.get(name='Grader')
				graders = group.user_set.all()
				graderLanguages = LanguagePair.objects.filter(user_id = graders)

				return render(request, 'records/enter_exam.html', {'form' : form, 'graderLanguages' : graderLanguages})
			#add the two targets text to the input queue
			addTargetTextToInputQueue(newExam, 1)
			addTargetTextToInputQueue(newExam, 2)		
			return redirect("/{0}/".format(request.user.username))
		else:
			#Zach Montgomery: all the variables needed in order to get the grader lanugagepairs
			group = Group.objects.get(name='Grader')
			graders = group.user_set.all()
		
			graderLangs = {}
			for grader in graders:
				l = ()
				for lang in grader.languagepair_set.all():
					l += (lang.language.language,)
				graderLangs[grader.id] = l

			return render(request, 'records/enter_exam.html', {'form' : form, 'graderLanguages' : graderLangs, 'graders':graders})

	else: #Else gets called the first time the page loads when there had been no submit

		#Gets the group 'Grader' from the Group model 
		group = Group.objects.get(name='Grader')
		
		#This is a set of all the users in the group 'Grader'
		graders = group.user_set.all()

		#Dictionary of graders as keys and a tuple of their languages as values
		#Key(grader): Value(language, language, etc.)
		graderLangs = {}
		for grader in graders:
			l = ()
			for lang in grader.languagepair_set.all():
				l += (lang.language.language,)
			graderLangs[grader.id] = l

		#returns an empty form and all of the grader -- languagepair combinations		
		return render(request, 'records/enter_exam.html', {'form' : NewExamForm(), 'graderLanguages':graderLangs, 'graders':graders})
		
def listAllQuedRecords(request):
	return render(request, 'records/list_all_qued_records.html', {'records' : Record.objects.all()})
	

#=========================================================================================================================
#Used to send the target text to be verified. This section does work but the Discrepency portion of the code does not work
#Need to add a new TargetDiscrepencyQueue in the models to finish this code. For now we are not going to do target verification
#=========================================================================================================================

##the user submitted the request (target text) for the second (or more) time, and it needs to be verified with what was before
#def verifyExamRecord(request, examNumber, passageNumber):
#
#	exam = Exam.objects.get(examNumber = examNumber)
#	if passageNumber == "1":
#		targetToVerify = exam.targetText1
#	else:
#		targetToVerify = exam.targetText2
#
#
#	if request.method == "POST":
#		#verify that the POST data matches what is in the DB
#		targetToVerify.importer2 = request.user
#		targetToVerify.save()


		
		#add to the discrepency table, and have the other person view the diff
#		removeTargetTextFromReviewQueue(targetToVerify)
#		discrepencyObject = Discrepancy(text = targetToVerify, 
#											modifiedText = request.POST["text"].strip(), 
#											user = targetToVerify.importer1,
#											numTimesVerified = 0,
#											comments = request.POST["comments"])
#		discrepencyObject.save()
#		return redirect("/{0}/".format(request.user.username))
#	else:
#		return render(request, 'records/verify_exam_record.html', {'exam': exam, 'passageNumber' : passageNumber})

		
	
# this can be helper method used by the upload legacy exam and other exam entry functions to upload pdf scan of exam
def uploadPDF(request):
    if request.method == 'POST':
        examNumber = request.POST['examNumberPDF']
        pdf = request.FILES["file"] #need to make sure that '<form action..' includes attribute "enctype="multipart/form-data"
    	uri = handle_uploaded_pdf(pdf, examNumber)
    else:
    	uri = None	# no file selected?
    return HttpResponse(uri)


# helper function for uploadPDF  
def handle_uploaded_pdf(pdf, examNumber):
    # collect information to create filename and filepath according to naming conventions from issue #55 + examNumber
    filename = examNumber + '.pdf'
    filepath = FILE_UPLOAD_DIR + "/" + filename
    # write file to specified path. writing in chunks since files will be "25-75mb"
    with open(filepath, 'wb+') as dest:
        for chunk in pdf.chunks():
            dest.write(chunk)
    return filename
