from django.template import RequestContext
from cegroups.models import permObjects, groupPermissions
from django.contrib.auth.models import User, Group
from django import template
from django.http import HttpResponse, HttpResponseRedirect



register = template.Library()

@register.tag
def userObjects(request):
	
	if request.user is not None:
		user = request.user
		if user.is_authenticated():
			if user.groups.all().first() is not None:
				group   			= user.groups.all().first()
				userObjects         = groupPermissions.objects.filter(groupId = group.id)
				return {'userObjects': userObjects}
			else:
				return {'userObjects':''}
	return {'userObjects':''}