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
		addTargetTextToReviewQueue(newTargetText, exam)
		removeTargetTextFromInputQueue(exam, int(passageNumber))
		return redirect("/{0}/".format(request.user.username))
			
	#render the add new target text form
	else:		
		return render(request, 'records/enter_exam_record.html', {'exam': exam, 'passageNumber' : passageNumber})

def enterExamRecord_internal(request, examNumber, targetText):
	newTargetText = TargetText(text      = postData["text"], 
								   importer1 = User.objects.get(username = request.user.username))
	newTargetText.save()
	exam.targetText1 = newTargetText
	exam.save()
	addTargetTextToReviewQueue(newTargetText, exam)
	removeTargetTextFromInputQueue(exam, 1)
	return render(request, 'records/temp_out.html', {'newRecord': exam})


#enter a new exam into the database
def enterNewExam(request):
	if request.method == 'POST':
		form = NewExamForm(request.POST)
		
		if form.is_valid():
			newExam = Exam(examNumber            = form.cleaned_data["examNumber"],
					   	   secondPassage         = form.cleaned_data["secondPassage"],
					   	   aPassageMarkings      = False, 
					       secondPassageMarkings = False,
					       grader1               = int(form.cleaned_data["grader1"]),
					       grader2               = int(form.cleaned_data["grader2"]),
					       grader3               = int(form.cleaned_data["grader3"]),
					       grader4               = int(form.cleaned_data["grader4"]),
					       sourceText1           = SourceText.objects.all().get(pk = form.cleaned_data["sourceText1"]),
					       sourceText2           = SourceText.objects.all().get(pk = form.cleaned_data["sourceText2"]),
					       sourceLanguage        = Language.objects.all().get(language = form.cleaned_data["sourceLanguage"]),
					       targetLanguage        = Language.objects.all().get(language = form.cleaned_data["targetLanguage"]))
                
			newExam.save()
			#add the two targets text to the input queue
			addTargetTextToInputQueue(newExam, 1)
			addTargetTextToInputQueue(newExam, 2)		
			return redirect("/{0}/".format(request.user.username))
		else:
			group = Group.objects.get(name='Grader')
			graders = group.user_set.all()
			language = LanguagePair.objects.filter(user_id = graders)
			languages = Language.objects.all()
			return render(request, 'records/enter_exam.html', {'form' : NewExamForm(), 'graders' : graders, 'language' : language, 'languages' : languages})

	else:
		#gets the group Grader because this section will be used only for getting the graders
		group = Group.objects.get(name='Grader')
		
		#This is a set of all the users in the group 'Grader'
		graders = group.user_set.all()
		
		#graders and their language pairs
		language = LanguagePair.objects.filter(user_id = graders)
		
		#List of all the languages so you can get the graders language pair in english. Instead of 14 you can get spa or spanish
		languages = Language.objects.all()
						
		
		return render(request, 'records/enter_exam.html', {'form' : NewExamForm(), 'graders' : graders, 'language' : language, 'languages' : languages})
		
def listAllQuedRecords(request):
	return render(request, 'records/list_all_qued_records.html', {'records' : Record.objects.all()})
	
#the user submitted the request (target text) for the second (or more) time, and it needs to be verified with what was before
def verifyExamRecord(request, examNumber, passageNumber):

	exam = Exam.objects.get(examNumber = examNumber)
	if passageNumber == "1":
		targetToVerify = exam.targetText1
	else:
		targetToVerify = exam.targetText2
	
	if request.method == "POST":
		#verify that the POST data matches what is in the DB
		targetToVerify.importer2 = request.user
		targetToVerify.save()
		
		#add to the discrepency table, and have the other person view the diff
		removeTargetTextFromReviewQueue(targetToVerify)
		discrepencyObject = Discrepancy(text = targetToVerify, 
											modifiedText = request.POST["text"].strip(), 
											user = targetToVerify.importer1,
											numTimesVerified = 0,
											comments = request.POST["comments"])
		discrepencyObject.save()
		return redirect("/{0}/".format(request.user.username))
	else:
		return render(request, 'records/verify_exam_record.html', {'exam': exam, 'passageNumber' : passageNumber})

		
	
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
