from django.shortcuts import render
from httplib import HTTPResponse
from .models import Exam
from texts.models import Language, SourceText, TargetText
from grade.models import Error, GraderQueue, ErrorCode
from django.contrib.auth.models import User

import json

# Create your views here.

def enterExam(request):
	if request.method == "POST":
		e = Exam(examNumber = request.POST.get('examNumber'),
				 grader1 = User.objects.get(id=request.POST.get('grader1')),
				 grader2 = User.objects.get(id=request.POST.get('grader2')),
				 sourceText1 = SourceText.objects.get(id=request.POST.get('source1')),
				 sourceText2 = SourceText.objects.get(id=request.POST.get('source2')),
				 targetText1 = TargetText.objects.get(id=request.POST.get('target1')),
				 targetText2 = TargetText.objects.get(id=request.POST.get('target2')),
				 language = Language.objects.get(language=request.POST.get('language'))
				 )
		e.save()
	languages = Language.objects.all()
	return render(request, 'enterExam.html', {'languages': languages,})