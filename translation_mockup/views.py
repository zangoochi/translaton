from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from django.core.urlresolvers import reverse
from texts.models import TargetReviewQueue, TargetInputQueue, GraderQueue, SourceText, sourceReviewQueue, sourceDiscrepancyQueue
from userprofile.models import LanguagePair

def index(request):
	user = request.user
	if user.is_authenticated():
		return redirect(reverse(workFlow, args=[user.username]))
	else:
		return redirect('/login/')

def workFlow(request, userName):
	user = request.user
	if user.is_authenticated():		
		userLanguages       = map(lambda obj: obj.language, user.languagepair_set.all())
		# functions to get needed data for profile view
		#i can't get the weird foreign key querys to work so im doing this for now
		discrepancies       = user.discrepancy_set.all()
		filteredTargetTexts = getFilteredTargetTexts(user, userLanguages)
		examsToInput        = getFilteredExamsToInput(user, userLanguages)
		examsToGrade        = getFilteredExamsToGrade(user, userLanguages)
		return render(request, 'home/workflow.html', {'user': user,
													  'group': user.groups.all().first(), 
													  'targetTextsToReview' : filteredTargetTexts,
													  'examsToInput'		: examsToInput,
													  'examsToGrade'        : examsToGrade,
													  'discrepancies'       : discrepancies,
												      'sourceReview'        : sourceReviewQueue.objects.getQueue(user),
												      'sourceDiscrepency'   : sourceDiscrepancyQueue.objects.filter(needsToReview = user)})


##############################################################################################
#returns a list of filtered target texts that the specified user will be able to verify	
def getFilteredTargetTexts(user, userLanguages):
	targetTextsToReview = TargetReviewQueue.objects.filter()
	return filter(lambda t: t.targetText.importer1 != user and t.targetText.language in userLanguages, targetTextsToReview)

#returns a list of filteres exams that the specified user will be ablt to input
def getFilteredExamsToInput(user, userLanguages):
	return filter(lambda obj:  obj.exam.sourceLanguage in userLanguages and obj.exam.targetLanguage in userLanguages, TargetInputQueue.objects.all())

#returns a list of filteres exams that the specified user will be ablt to grade
def getFilteredExamsToGrade(user, userLanguages):
	return filter(lambda e: e.exam.sourceLanguage in userLanguages and e.exam.targetLanguage in userLanguages , GraderQueue.objects.all())
