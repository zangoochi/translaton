from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout 
from django.contrib import auth
from django.contrib.auth.models import User, Group
from login.forms import NewUserForm
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
    
#View to get user data from forms.py and updates database 
def createUser(request):
    
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
            if group == 'grader':
                u.is_staff = 0
                user = User.objects.get(id=u.id)
                
                #"Grader is group name in database"
                g = Group.objects.get(name='Grader')
                g.user_set.add(user)
                
            #if the new user is a test taker, then add them as a test taker to the auth_user_groups.
            elif group == "testTaker":
                u.is_staff = 0
                user = User.objects.get(id=u.id)
                
                #"Student" is group name in database
                g = Group.objects.get(name="TestTaker")
                g.user_set.add(user)
               
            #save the rest of the attributes of our new user to the database 
            u.save()

            #authenticates user to allow user to be logged straight into the website
            authUser = authenticate(username=username, password=password)
            if authUser is not None:
                auth.login(request, authUser)
            #redirect to the login home page
            return HttpResponseRedirect('/')
    
    #if this is the first time at the create user page and form has not yet been submitted.       
    else:
        
        #create a new empty form
        form = NewUserForm()
        
    #return the form. 
    return render(request, 'login/create_new_user.html/', {'form': form})

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




