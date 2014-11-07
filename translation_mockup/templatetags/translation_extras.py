from classytags.core import Tag, Options
from classytags.arguments import Argument
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
                group               = user.groups.all().first()
                userObjects         = groupPermissions.objects.filter(groupId = group.id)
                return {'userObjects': userObjects}
            else:
                return {'userObjects':''}
    return {'userObjects':''}


#Uses classy tags to store a variale and change the variable. 
#Will be used to store if admin is checking for object id's or on the actual page

class Admin_Check(Tag):
    name = 'AdminCheck'
    options = Options(
        Argument('name'),
        'as',
        Argument('varname', required=False, resolve=False)
    )   
    def render_tag(self, context, name, varname): 
        output = name
        if varname:
            context[varname] = output
            return ''
        else:
            return output 

register.tag(Admin_Check)
   










