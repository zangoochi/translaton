from django.http import HttpResponse, HttpResponseRedirect, QueryDict
from django.shortcuts import get_object_or_404, render, redirect
from texts.models import Error, GraderQueue,  Exam, Discrepancy, ErrorCode, createErrorFromPostData, ErrorJSON, editErrorFromPutData
from django.views.decorators.csrf import csrf_exempt
from texts.utils import findDifferenceInTexts
from django.core import serializers
import json

def index(request):
    return render(request, 'grade/index.html', {})

#insert an error into the database.
#POSTDATA: examID, passageLetter, errorCode, pointsDeducted, sourceErrorStartIndex
#		   sourceErrorEndIndex, targetErrorStartIndex, targetErrorEndIndex, comments
def errorWithoutID(request, examNumber, passageLetter):
	#create a new error
	if request.method == "POST":
		postData =  json.loads(request.body)
		error = createErrorFromPostData(postData)
		error.save()
		return HttpResponse(json.dumps(error.as_json()), mimetype="application/json")
	#get all of the errors for the exam
	if request.method == "GET":
		exam = Exam.objects.get(examNumber = examNumber)
		examErrors = exam.error_set.filter(passageLetter = passageLetter)
		return HttpResponse(serializeErrorsAsJSON(examErrors), mimetype="application/json")

def errorWithID(request, examNumber, passageLetter, errorID):
	error = Error.objects.get(pk = errorID)
	if request.method == "GET":
		return HttpResponse(json.dumps(error.as_json()), mimetype="application/json")

	if request.method == r"DELETE":
		error.delete();
		return HttpResponse("Error Deleted")

	if request.method == "PUT":
		putData =  json.loads(request.body)
		editErrorFromPutData(error, putData)
		return HttpResponse("Error Updated")

def finalizeGrading(request, examNumber, passageLetter):
	if request.method == "POST":
		examToFinalize = Exam.objects.get(examNumber = examNumber)
		if passageLetter == 'A':
			targetText = examToFinalize.targetText1
		else:
			targetText = examToFinalize.targetText2

		graderQueueObject = GraderQueue.objects.get(exam = examToFinalize, passageLetter = passageLetter)
		graderQueueObject.delete()

		targetText.doneGrading = True
		targetText.save()
		return HttpResponse("Target Text Finalized")


def insertHighlightJSON(request, examNumber, passageLetter):
	if request.method == "POST": 
		errorJSONSet = ErrorJSON.objects.filter(exam__examNumber = examNumber)
		if errorJSONSet.count() == 0:
			errorJSON = ErrorJSON()
			errorJSON.exam = Exam.objects.get(examNumber = examNumber)
		else:
			errorJSON = errorJSONSet[0]

		errorJSON.sourceJSON = request.POST['sourceJSON']
		errorJSON.targetJSON = request.POST['targetJSON']
		errorJSON.passageLetter = passageLetter
		errorJSON.save()

		return HttpResponse(errorJSON);
	
	else:
		exam = Exam.objects.get(examNumber = examNumber)
		return HttpResponse(serializers.serialize("json", ErrorJSON.objects.filter(exam = exam.pk, passageLetter = passageLetter)), mimetype="application/json")


def gradeExam(request, examNumber="-1", passageLetter="A"):
	if request.method == 'POST':
		examErrors = request.POST
		return render(request, 'grade/temp_out.html', {'examErrors': examErrors})
	else:
		errorCodes = ErrorCode.objects.all()
		if examNumber == "-1":
			return render(request, 'grade/grade_exam.html', {'errors': errorCodes})
		else:
			exam = Exam.objects.get(examNumber=examNumber)
			examErrors = exam.error_set.all()
			if passageLetter == "A":
				sourceText = exam.sourceText1
				targetText = exam.targetText1		
			else:
				sourceText = exam.sourceText2
				targetText = exam.targetText2
			
			print targetText.doneGrading
			return render(request, 'grade/grade_exam_mockup.html', { 'examErrors' : examErrors, 
																	'exam'      : exam,
																	'errorCodes': errorCodes, 
															 		'sourceText' : sourceText, 
														   			'targetText' : targetText})																													 
#render the discrepencys between texts
def discrepancyReview(request, discrepancyID):
	discrepancy = Discrepancy.objects.get(pk=discrepancyID)
	#verification submitted. make sure it passed
	if request.method == "POST":
		#hacky workaround, sometimes the input field contains html spaces which aren't equal to the empty char
		modifiedText = request.POST["verifiedText"].strip().replace(u'\xa0', u' ')
		
		#verifivation passed: add one to the verification
		if modifiedText == discrepancy.text.text.strip():
			discrepancy.numTimesVerifyied += 1
			if discrepancy.numTimesVerifyied >= 2:
				discrepancy.delete()
		#verification failed: reset the counter
		else:
			discrepancy.numTimesVerifyied = 0
		
		if discrepancy.numTimesVerifyied < 2:
			discrepancy.modifiedText = modifiedText
			discrepancyText = discrepancy.text
			discrepancy.user = discrepancyText.importer1 if discrepancyText.importer1 != request.user else discrepancyText.importer2
			discrepancy.save()
		
		return redirect('/')
	#render the original form
	else:
		originalText = discrepancy.text.text
		modifiedText = discrepancy.modifiedText

		formattedDiff = findDifferenceInTexts(originalText, modifiedText)
		return render(request, 'grade/discrepancy_review.html', {'originalText' : originalText, 
																 'modifiedText' : formattedDiff,
																 'discrepancyID': discrepancy.pk})
def serializeErrorsAsJSON(errors):
	errorObjects = [obj.as_json() for obj in errors]
	return json.dumps(errorObjects)

#return an html string of modified words where the differences are highlihgted
def findDifferenceInTexts(originalText, modifiedText):
	originalWords = originalText.split(' ')
	modifiedWords = modifiedText.split(' ')

	for i in range(len(modifiedWords)):
		#checking for words that were misspelled
		if i < len(originalWords):
			if modifiedWords[i].strip() != originalWords[i].strip():
				modifiedWords[i] = highlightWord(modifiedWords[i], "yellow")
		#checking for words that were added
		else:
				modifiedWords[i] = highlightWord(modifiedWords[i], "red")

	return ' ' .join(modifiedWords)

def highlightWord(word, color):
	return '<span style="background-color:{0};">{1}</span>'.format(color, word)

def saveHighHTML(request, examNumber, passageLetter):
	exam = Exam.objects.get(id=examNumber)
	highHtmlObj = HighlightedHTML.objects.get(exam=exam)
	#print highHtmlObj
	if (passageLetter == "A"):
		if (request.POST['frameId'] == "source"):
			highHtmlObj.sourceHTML1 = request.POST['html']
		elif (request.POST['frameId'] == "target"):
			highHtmlObj.targetHTML1 = request.POST['html']
	else:
		if (request.POST['frameId'] == "source"):
			highHtmlObj.sourcHTML2 = request.POST['html']
		elif (request.POST['frameId'] == "target"):
			highHtmlObj.targetHTML2 = request.POST['html']
	highHtmlObj.save()
