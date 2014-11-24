#=====================================================================================================
#Description:
#views.py for new source. This is the logic behind entering new source, and the data input for those sources. 
#=====================================================================================================
#
#Edited by: Abdullah Mashabi
#Date:		10/23/14
#Contact Info: amashabi@kent.edu
#Changes made: Remove reviewing structure from creating a source text. (Ticket #593) 
#              When adding reviewSourceText functionality, you need to check the following 5 files as well;
#			   \translation\texts\views.py, \translation\texts\models.py, \translation\texts\urls.py, 
#	 	 	   \translation\translation_mockup\views.py and translation/translation_mockup/templates/workflow.html
#
#Edited by: Abdullah Mashabi
#Date:		11/21/14
#Contact Info: amashabi@kent.edu
#Changes made: Add the needed functionality to allow the admin view and save the edited source texts. 
#				(Ticket #711) and  (Ticket #710)
#
#
#=====================================================================================================

from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from texts.models import Language, SourceText, sourceDiscrepancyQueue
from texts.utils import findDifferenceInTexts
from texts.forms import NewSourceTextForm
import os, imp


def index(request):
    return render(request, 'texts/index.html', {})

	
#=========================================================================================================================
# def enterNewSource is for the new source entry. (enter_new_source.html)
#=========================================================================================================================
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
			
			# Please check def reviewSourceText() below.
			#queueEntry = sourceReviewQueue(source = newSrc)
			#queueEntry.save()
			
 			user = request.user			

			return HttpResponseRedirect('/' + user.username)
		else:
			return render(request, 'texts/enter_new_source.html', {'form' : newSourceTextForm})
	else:
		return render(request, 'texts/enter_new_source.html', {'form' : NewSourceTextForm()})

		
#=========================================================================================================================
#def reviewSourceText is used in the (new_source_review_form.html)
#At this point in the project, the entered source text should not be sent to the source queue to be reviewed. 
#After the foundation is built and working, we then can add the functionality of reviewing the entered source text.
#=========================================================================================================================
#def reviewSourceText(request, sourceId):
#	sourceText = SourceText.objects.get(id = sourceId)
#	user = request.user
#	if request.method == 'POST':
#		post = request.POST
#		queue = sourceReviewQueue.objects.get(source=sourceText)
#		if sourceText.equalToPost(post):
#			sourceText.importer2 = user
#			sourceText.save()
#			queue.delete()
#		else:
#			queue.delete()
#			langs = Language.objects.all()
#			sourceDiscrep = sourceDiscrepancyQueue(importer1 = sourceText.importer1,
#				   								   importer2 = user,
#				   								   needsToReview = sourceText.importer1,
#				   								   originalSource = sourceText,
#				   								   sourceLanguage = langs.get(language = post['sourceLanguage']),
#				   								   targetLanguage = langs.get(language = post['targetLanguage']),
#				   								   year = int(post['year']),
#				   								   setNumber = int(post['setNumber']),
#				   								   passageLetter = post["passageLetter"],
#				   								   versionNumber = int(post["versionNumber"]),
#				   								   text = post['sourcePassage'])
#			sourceDiscrep.save()
#		return HttpResponseRedirect('/' + user.username)
#	else:
#		return render(request, 'texts/new_source_review_form.html', {'langs': Language.objects.all(),
#	                                                 	             'sourceToReview': sourceText})


#=========================================================================================================================
# def reviewSourceDiscrepency is used in the (discrepency_source_review.html)
#=========================================================================================================================
def reviewSourceDiscrepency(request, sourceId): # sourceId is the id of the originally input as that is the one that is in sourceText table
	user = request.user
	sourceDiscrep = sourceDiscrepancyQueue.objects.get(originalSource__id = sourceId)
	if request.method == 'POST':
		post = request.POST
		sourceText = SourceText.objects.get(id = sourceId)
		sourceText.setToPost(post) # the source text gets set to post any-time changes are made and locks when no changes are made during a review
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

																		#returns the source text from the DB, -1 is filler text for testing purposes for now


#=========================================================================================================================
#def listAllSources is used in the (list_all_source_texts.html) to list all the existing source texts
#=========================================================================================================================	
def listAllSources(request):
	sourceText = SourceText.objects.all()
	return render(request, 'texts/list_all_source_texts.html', {'sourceTexts' : sourceText})

	
#=========================================================================================================================
#def sourceText is used in the (list_all_source_texts.html) to return all the existing source texts
#=========================================================================================================================																		
def sourceText(request, sourceTextID="-1"):
	if sourceTextID == "-1":
		return render(request, 'texts/list_all_source_texts.html', {})
	else:
		sourceText = SourceText.objects.get(pk=sourceTextID)
		return render(request, 'texts/edit_source_texts.html', {'textId' : sourceText.id, 'text' : sourceText.text,
			'name' : sourceText, 'year' : sourceText.year, 'passageLetter' : sourceText.passageLetter, 
			'sourceLanguage' : sourceText.sourceLanguage, 'targetLanguage' : sourceText.targetLanguage,
			'setNumber' : sourceText.setNumber, 'versionNumber' : sourceText.versionNumber})

			
#=========================================================================================================================
#def saveEditSource is used in the (edit_source_texts.html)
# edit_source_texts.html allows the admin to edit the source texts and re-save them
#=========================================================================================================================		
def saveEditSource(request, sourceTextID): 
	sourceText = SourceText.objects.get(pk=sourceTextID)
	if request.method == 'POST':
		user = request.user
		post = request.POST
		print post["text"]
		sourceText = SourceText.objects.get(id = sourceTextID)
		sourceText.text = post["text"]
		sourceText.save()
		return HttpResponseRedirect("/texts/save-edit-source/" + str(sourceText.id))
		
	else:	
		sourceText = SourceText.objects.get(pk=sourceTextID)
		print "Hello"
		return render(request, 'texts/edit_source_texts.html', {'textId' : sourceText.id, 'text' : sourceText.text, 'versionNumber' : sourceText.versionNumber})
	
	
#=========================================================================================================================	
# End of views.py 
#=========================================================================================================================	
		
