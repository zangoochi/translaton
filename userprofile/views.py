from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import get_object_or_404, render
from django.contrib.auth import authenticate, login
from texts.models import TargetReviewQueue, TargetInputQueue
from userprofile.models import LanguagePair

#1rst following view def will be deleted once login and session is in place
def tempIndex(request):
	return render(request, 'userprofile/index.html', {})

def index(request, userName):
	user = request.user
	userLangs = LanguagePair.objects.filter(user = user)
	return render(request, 'userprofile/index.html', {'user': user, 
													  'group': user.groups.all().first(),
													  'userLangs': userLangs})
