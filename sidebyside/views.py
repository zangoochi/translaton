from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from texts.models import SourceText, TargetText

def index(request):
    return render(request, 'sidebyside/index.html', {})

#returns the source text from the DB, -1 is filler text for testing purposes for now
def sourceText(request, sourceTextID="-1"):
	if sourceTextID == "-1":
		return render(request, 'sidebyside/source_text.html', {})
	else:
		sourceText = SourceText.objects.get(pk=sourceTextID)
		return render(request, 'sidebyside/highlight.html', {'text' : sourceText.text, 'name' : sourceText})
		
#returns the target text from the DB, -1 is the filler text for testing purposes for now
def targetText(request, targetTextID="-1"):
	if targetTextID == "-1":
		return render(request, 'sidebyside/target_text.html', {})
	else:
		targetText = TargetText.objects.get(pk=targetTextID)
		return render(request, 'sidebyside/highlight.html', {'text' : targetText.text}) 

#highlight.html is the template for making highlighting pages work inside the iframes....i hope that goes away
def profile(request, user):
	return render(request, 'sidebyside/profile.html', {})