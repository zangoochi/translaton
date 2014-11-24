# =====================================================================================================
#Description:
# All views used by the cegroups application
#
# Created by: Brandon Kessell
# Date: 13-OCT-2014
# Version: 1.0
# Contact info: bkessell@kent.edu
#
#Edited By: Zach Montgomery
#Contact Info: zmontgom@kent.edu
#Date: 10/30/14
#Changes Made: Created editUserOption, saveUserOption, and change_password. These changes are to add/edit users, 
#				as well as change user input such as email address, first name, and last name. 

#Edited by: Abdullah Mashabi
#Date:10/31/14
#Contact Info: amashabi@kent.edu
#Changes made: Added the needed functionalities for groups section to allow the admin
#			   to view, create, edit, and remove groups in the admin page. (Ticket #632)
#
#Edited By: Zach Montgomery
#Contact Info: zmontgom@kent.edu
#Date: 11/03/14
#Changes Made: Edited the editUserOption to include editing emails, passwords and passwords right in the user
#				view section, and also added the Group table column which when clicked allows the admin to change the 
#				group the user belongs to. The select box will be given the users group as default and on change, will update
#				the form. This way the forms do not have submit buttons all over the document and has a clean look to them. 

#				Also added the '@is_admin' and '@login_requred'. Both of these are in a file called filters.py in login app. These
#				are used to block links to specific views. Just by limiting the button for a user doesn't mean the url is disabled too. 
#				By using these Decorators, we are able to stop a view from working. They are placed in a separate file for because since
#				group names change, these will need to be changed to accomodate the new group names. This makes changing very easy and just
#				need to change in one file.
# =====================================================================================================
from django.contrib.auth.hashers import make_password
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from cegroups.models import permOptions
from cegroups.models import permObjects
from cegroups.models import groupPermissions
from cegroups.models import permObjectParent
from texts.models import Language
from userprofile.models import LanguagePair
from django.contrib.auth.models import User, Group
from django.contrib.auth import authenticate, login
from login.forms import NewUserForm
from login.filters import *
from texts.models import SourceText, TargetText
from texts.forms import NewSourceTextForm
from texts.models import Language, SourceText, sourceDiscrepancyQueue
from texts.utils import findDifferenceInTexts




#This view can only be accessed by a logged in user that is under the Administration Group. Does not limit all 
#views, only the definition assigned to. So this one only checks the index def. Since index calls all the others, 
#it is safe to just place here. 
@login_required
@is_admin

#Tell Django this application has an index page as well as what views the index page is able to access
def index(request):

	users = User.objects.all()
	form = NewUserForm()
	groups = Group.objects.all()
	permobjects = permObjects.objects.all()
	languages = Language.objects.all()
	grouppermissions = groupPermissions.objects.all()

	return render(request, 'index.html', {	'userName' : getCurrentUserName(request),
									'userId' : getCurrentUserId(request),
									'groups':   groups,
									'userGroups' : getCurrentGroups(request),
									'permissions' : getPermissionsForUser(request),
									'permissionhierarchy' : getPermissionsForHierarchy(request),
									'permoptions' : getAllPermissionOptions(request),
									'groupPermissions' : grouppermissions,
									'permobjects' : getAllPermissionObjects(request),
									'users'       : users	,
									'permObjects' : permobjects,
									'languages'   : languages,									
									'form'        :form});

#Returns the name of the currently logged in user
def getCurrentUserName(request):
	return request.user;

#Returns the id of the currently logged in user
def getCurrentUserId(request):
	return request.user.id;

#Returns all groups the currently logged in user is a member of
def getCurrentGroups(request):
	return request.user.groups.all();

#Returns a unique list of permissions for the current user
def getPermissionsForUser(request):
	foundPermissions = [];
	for gp in getCurrentGroups(request):
		for permission in groupPermissions.objects.all().filter(groupId = gp.id):
			if permission not in foundPermissions:
				foundPermissions.append(permission);
	return foundPermissions;

#Returns a list of hierarchy objects permissions for a given user
def getPermissionsForHierarchy(request):
	foundPermissions = getPermissionsForUser(request);
	for permission in foundPermissions:
		if permission not in permObjectParent.objects.all().filter(parentObject = permission.permObject):
			foundPermissions.remove(permission);
	return foundPermissions;

#Returns all permission options
def getAllPermissionOptions(request):
	return permOptions.objects.all().order_by("id");

#Returns all group permission
def getAllPermissionGroup(request):
	return groupPermissions.objects.all().order_by("id");

#Returns all permission objects
def getAllPermissionObjects(request):
	return permObjects.objects.all();

#Saves the permission type
def savePermissionOption(request):
	#iterate through the POST input
	for saveId, saveDescription in request.POST.iteritems():
		saveDescription = request.POST.get(saveId);
		#the key will either be a description, or an option id
		if saveId == "description":
			option, wasCreated = permOptions.objects.get_or_create(description=saveDescription, defaults={"description": saveDescription});
			option.save();
		elif saveId.isdigit():
			option = permOptions.objects.get(id=int(saveId));
			option.description = saveDescription;
			option.save();
	return HttpResponseRedirect('..');

#Saves the permission object
def savePermissionObject(request):
	#iterate through the POST input
	for saveId, saveName in request.POST.iteritems():
		saveName = request.POST.get(saveId);
		#the key will either be a description, or an option id
		if saveId == "objectName":
			po, wasCreated = permObjects.objects.get_or_create(objectName=saveName, defaults={"objectName": saveName});
			po.save();
		elif saveId.isdigit():
			po = permObjects.objects.get(id=int(saveId));
			po.objectName = saveName;
			po.save();
	return HttpResponseRedirect('..');


# Saves the group name
def saveGroupOption(request):
	#iterate through the POST input
	for saveId, saveGroup in request.POST.iteritems():
		saveGroup = request.POST.get(saveId);
	if saveId == "name":
		option, wasCreated = Group.objects.get_or_create(name=saveGroup, defaults={"name":saveGroup});
		option.save();
	elif saveId.isdigit():
		option = Group.objects.get(id=int(saveId));
		option.name = saveGroup;
		option.save();
	return HttpResponseRedirect('..');

# Edit the group name
def editGroupOption(request):
	if request.method == "POST":
		groupname = False

		for saveId, savegroupname in request.POST.iteritems():
			savegroupname = request.POST.get(saveId)
			if saveId == 'groupname':
				groupname = True

		for saveId, savegroupname in request.POST.iteritems():
			if saveId.isdigit():
				option = Group.objects.get(id=int(saveId))
				if groupname == True:
					option.name = savegroupname
					option.save()
					return HttpResponseRedirect('/cegroups/')
					
	return HttpResponseRedirect('/cegroups/');

# Save and edit group permission
def saveGroupPermission(request):
	if request.method == "POST":
		group = None

		for saveId, savegroupname in request.POST.iteritems():
			savegroupname = request.POST.get(saveId)

			if Group.objects.filter(name=savegroupname).exists():
				group = Group.objects.get(name=savegroupname)


		for saveId, savegroupname in request.POST.iteritems():
			if saveId.isdigit():
				option = permObjects.objects.get(id = saveId)				
				g, created = groupPermissions.objects.get_or_create(groupId=group, permObject=option)
				if not created:
					groupPermissions.objects.get(groupId=group, permObject=option).delete()
					
	return HttpResponseRedirect('/cegroups/');
	
#Used to edit chosen users first name and last name columns	
def editUserOption(request):
	if request.method == "POST":
		lastSubmit = False
		groupSubmit = False
		passSubmit = False
		emailSubmit = False
		languageSubmit = False

		#Decides which form is being submitted
		for saveId, saveName in request.POST.iteritems():
			saveName = request.POST.get(saveId)

			print saveId
			print saveName

			if saveId == 'lastSubmit':
				lastSubmit = True
			elif saveId == 'groupSubmit':
				groupSubmit = True
			elif saveId == 'passSubmit':
				passSubmit = True
			elif saveId == 'emailSubmit':
				emailSubmit = True
			elif saveId == 'languageSubmit':
				languageSubmit = True

		#Gets User and sets either first_name or last_name depending on lastSubmit
		for saveId, saveName in request.POST.iteritems():
			if saveId.isdigit():
				option = User.objects.get(id=int(saveId))

				if lastSubmit == True:
					option.last_name = saveName
					option.save()
					return HttpResponseRedirect('/cegroups/')
				elif groupSubmit == True:
					option.groups.clear()
					g = Group.objects.get(name=saveName)
					g.user_set.add(option)
				elif passSubmit == True:
					pw = make_password(saveName)
					option.password = pw
					option.save()
				elif emailSubmit == True:
					option.email = saveName
					option.save()
				elif languageSubmit == True:
					lng = Language.objects.get(language=saveName)
					pair, created = LanguagePair.objects.get_or_create(user=option, language=lng)
					if not created:
						LanguagePair.objects.get(user=option, language=lng).delete()
				else:
					option.first_name = saveName
					option.save()
					return HttpResponseRedirect('/cegroups/#users/')

	return HttpResponseRedirect('/cegroups/');


#Saves the permission type
def saveUserOption(request):
	#If the template form is filled out and submitted
	if request.method == "POST":
		#create new form
		form = NewUserForm(request.POST)

		#check that the form is valid
		if form.is_valid():
			
			#clean all the data. This calls the any validation such as required field.
			username = form.cleaned_data['username']
			password = form.cleaned_data["password"]
			firstName = form.cleaned_data['first_name']
			lastName = form.cleaned_data['last_name']
			email = form.cleaned_data['email']
			group = form.cleaned_data['group']
			
			
			#checks among already created users and returns an HttpResponse if the user already exists
			userCheck = User.objects.all()
			for user in userCheck:
				if username == user.username:
					 HttpResponse("User already exists.")
			#create user object in the auth_user table
			u = User.objects.create_user(username, email, password)
			u.first_name = firstName
			u.last_name = lastName
			
			
			#if the new user is a grader, then add them as a grader to the auth_user_groups.
			u.is_staff = 0
			user = User.objects.get(id=u.id)
				
			#"Grader is group name in database"
			g = Group.objects.get(name=group)
			g.user_set.add(user)
			   
			#save the rest of the attributes of our new user to the database 
			u.save()

		   
			#redirect to the login home page
			return HttpResponseRedirect('..')
	else:
		form = NewUserForm()
	#return the form. 
	users = User.objects.all()
	return render(request, 'index.html', {	'userName' : getCurrentUserName(request),
									'userId' : getCurrentUserId(request),
									'userGroups' : getCurrentGroups(request),
									'permissions' : getPermissionsForUser(request),
									'permissionhierarchy' : getPermissionsForHierarchy(request),
									'permoptions' : getAllPermissionOptions(request),
									'permobjects' : getAllPermissionObjects(request),
									'users'       : users	,
									'form'        :form});

#Deletes the given permission types
def removePermissionOption(request):
	todel = request.POST.getlist("todelete")
	permOptions.objects.filter(id__in=todel).delete();
	return HttpResponseRedirect('..');

#Deletes the given permission objects
def removePermissionObject(request):
	todel = request.POST.getlist("todelete")
	permObjects.objects.filter(id__in=todel).delete();
	return HttpResponseRedirect('..');
	
#Deletes the given group names
def removeGroupOption(request):
	todel = request.POST.getlist("grouptodelete")
	Group.objects.filter(id__in=todel).delete();
	return HttpResponseRedirect('..');

#Deletes the given users
def removeUserOption(request):
	todel = request.POST.getlist("usertodelete")

	for op in todel:
		user = User.objects.filter(id=op)
		user.delete()
	return HttpResponseRedirect('..')



