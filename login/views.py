#=====================================================================================================
#Description:
#Views for login. This is the logic behind the user login and user data such as passwords and emails, along with 
#creating users. 
#=====================================================================================================

#Edited by: Zach Montgomery
#Date:10/20/14
#Contact Info: zmontgom@kent.edu
#Changes made: Created change_email view to allow a user to change their email. This uses the ChangeEmailForm in forms.py 
#to create the form. The form has the user input the new email address twice to verify data integrity.
#=====================================================================================================



from django.shortcuts import render, redirect, render_to_response
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout 
from django.contrib import auth
from django.contrib.auth.models import User, Group
from login.forms import NewUserForm, ChangeEmailForm
from django.contrib.auth.forms import PasswordChangeForm


def index(request):
	return render(request, "login/index.html", {})

def authenticateAndLoginUser(request):
	if request.method == "POST":
		if request.user.is_authenticated() == False:
			return authenticateAndLoginUserInternal(request)
		else:
			#already logged in
			return redirect('/')

def authenticateAndLoginUserInternal(request):
	username = request.POST["username"]
	password = request.POST["password"]
	user = authenticate(username = username, password = password)
	if user is not None:
		login(request, user)
		return redirect('/')
	else:
		return HttpResponse("login failed")

def logoutUser(request):
	logout(request)
	return redirect('/')

#Zach Montgomery added on 10/14/14
#creates view for a user to change passwords.
def password_change(request):
    if request.method == "POST":

        #creates Django pre-made form PasswordChangeForm
        form = PasswordChangeForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/accounts/password/change/done')
    return render_to_response('password_change_form.html', args)
    
#Zach Montgomery added on 10/14/14
#creates view for after a user changes his/her passwords
def password_change_done(request):
    return render_to_response('password_change_done.html') 

def change_email(request):
    if request.method == "POST":
        user = request.user
        form = ChangeEmailForm(request.POST)

        if form.is_valid():
            email1 = form.cleaned_data['new_email']
            email2 = form.cleaned_data["email_confirmation"]

            if email1 == email2:
                user.email = email1
                user.save()
                return HttpResponseRedirect('/')
        else:
            return render(request, 'login/change_email.html/', {'form':form})

    else:
        form = ChangeEmailForm()
    return render(request, 'login/change_email.html/', {'form': form})







