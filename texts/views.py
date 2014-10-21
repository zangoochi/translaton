from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from texts.models import Language, SourceText, sourceReviewQueue, sourceDiscrepancyQueue
from texts.utils import findDifferenceInTexts
from texts.forms import NewSourceTextForm

import os, imp
#KeywordManager = imp.load_source('KeywordManager', os.getcwd() + "/keyword/KeywordManager.py")
#keywordManager = KeywordManager.KeywordManager()

def index(request):
    return render(request, 'texts/index.html', {})

def enterNewSource(request):
	langs = Language.objects.all()
	if request.method == 'POST':
		newSourceTextForm  = NewSourceTextForm(request.POST)
		if newSourceTextForm.is_valid():
			newSrc = SourceText(sourceLanguage = langs.get(language = newSourceTextForm.cleaned_data['sourceLanguage']),
						    	targetLanguage = langs.get(language = newSourceTextForm.cleaned_data['targetLanguage']),
						    	year = newSourceTextForm.cleaned_data['year'],
						    	setNumber = newSourceTextForm.cleaned_data['setNumber'],
						    	passageLetter = newSourceTextForm.cleaned_data['passageLetter'],
						    	versionNumber = newSourceTextForm.cleaned_data['versionNumber'],
						    	text = newSourceTextForm.cleaned_data['sourcePassage'],
						    	importer1 = request.user,
						    	importer2 = None)
			newSrc.save()
			queueEntry = sourceReviewQueue(source = newSrc)
			queueEntry.save()
 			user = request.user	
            #prepcrocess the text so we can use the keyword in context features on it
            #keywordManager.addKeywordsFromDocument(newSrc)		

			return HttpResponseRedirect('/' + user.username)
		else:
			return render(request, 'texts/enter_new_source.html', {'form' : newSourceTextForm})
	else:
		return render(request, 'texts/enter_new_source.html', {'form' : NewSourceTextForm()})

def reviewSourceText(request, sourceId):
	sourceText = SourceText.objects.get(id = sourceId)
	user = request.user
	if request.method == 'POST':
		post = request.POST
		queue = sourceReviewQueue.objects.get(source=sourceText)
		if sourceText.equalToPost(post):
			sourceText.importer2 = user
			sourceText.save()
			queue.delete()
		else:
			#delete queue item from the sourceReviewQueue
			queue.delete()
			langs = Language.objects.all()

			#Saves data to sourceDiscrepancy
			sourceDiscrep = sourceDiscrepancyQueue(importer1 = sourceText.importer1,
				   								   importer2 = user,
				   								   needsToReview = sourceText.importer1,
				   								   originalSource = sourceText,
				   								   sourceLanguage = langs.get(language = post['sourceLanguage']),
				   								   targetLanguage = langs.get(language = post['targetLanguage']),
				   								   year = int(post['year']),
				   								   setNumber = int(post['setNumber']),
				   								   passageLetter = post["passageLetter"],
				   								   versionNumber = int(post["versionNumber"]),
				   								   text = post['sourcePassage'])
			sourceDiscrep.save()
		return HttpResponseRedirect('/' + user.username)
	else:
		return render(request, 'texts/new_source_review_form.html', {'langs': Language.objects.all(),
	                                                 	             'sourceToReview': sourceText})


def reviewSourceDiscrepency(request, sourceId): # sourceId is the id of the originally input as that is the one that is in sourceText table
	user = request.user
	sourceDiscrep = sourceDiscrepancyQueue.objects.get(originalSource__id = sourceId)
	if request.method == 'POST':
		post = request.POST
		print post
		sourceText = SourceText.objects.get(id = sourceId)
		sourceText.setToPost(post) # the source text gets set to post anytime changes are made and locks when no changes are made during a review
		if sourceDiscrep.equalToPost(post):
			sourceText.importer2 = sourceDiscrep.importer2 #this will lock source text as importer1 and 2 are set
			sourceText.save()
			sourceDiscrep.delete()
		else:
			sourceText.setToOtherSource(sourceDiscrep)
			sourceText.save()					
			sourceDiscrep.setToPost(post)					
			sourceDiscrep.needsToReview = sourceDiscrep.otherImporter(user)
			sourceDiscrep.save()

		return HttpResponseRedirect('/' + user.username)		
	else:
		
		highlightedModifiedDiff = findDifferenceInTexts(sourceDiscrep.originalSource.text, sourceDiscrep.text)
		return render(request, 'texts/discrepency_source_review.html', {'sourceDiscrepency': sourceDiscrep,
																		'highlightedDiff': highlightedModifiedDiff,
																		'langs': Language.objects.all()})


def listAllSources(request):
	return render(request, 'texts/list_all_source_texts.html', {'sourceTexts':SourceText.objects.all()})
