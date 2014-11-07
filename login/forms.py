#=====================================================================================================
#Description:
#Django form for creating new users and for changing passwords 
#=====================================================================================================

#Edited by: Zach Montgomery
#Date:10/20/14
#Contact Info: zmontgom@kent.edu
#Changes made: Added ChangeEmailForm to provide the form for a user to change his/her email address.

#Date:10/29/14
#Contact Info: zmontgom@kent.edu
#Changes made: Changed CHOICES to get all groups out of the database and list them in the groups selection option. 
#				This is needed so that if/when the admin creates a new group, that group will be automatically available
#				as an option when the admin creates a new user
#=====================================================================================================


from django import forms
from django.contrib.auth.models import User, Group
from django.core.exceptions import ValidationError

groups = Group.objects.all()

CHOICES = []
for group in groups:
	CHOICES.append((group,group))


class NewUserForm(forms.Form):
    error_css_class = 'error'
    
    username = forms.CharField(label="username", required=True)
    password = forms.CharField(widget=forms.PasswordInput(), required=True)
    first_name = forms.CharField(label="First Name")
    last_name = forms.CharField(label="Last Name")
    email = forms.EmailField()
    group = forms.ChoiceField(choices=CHOICES, widget=forms.Select(), required=True)

    def clean_group(self):
    	group_cleaned = self.cleaned_data.get('group')
    	if group_cleaned is None:
    		raise ValidationError("User must belong to a group")
    	else:
    		return group_cleaned

class ChangeEmailForm(forms.Form):
	error_css_class = 'error'

	new_email = forms.EmailField()
	email_confirmation = forms.EmailField()
	
	

	def clean_email_confirmation(self):
		newEmail_cleaned = self.cleaned_data.get('new_email')
		confirmedEmail = self.cleaned_data.get('email_confirmation')
		print newEmail_cleaned
		print confirmedEmail

		if newEmail_cleaned != confirmedEmail:
			raise ValidationError("Email addresses do not match!")
		else:
			return newEmail_cleaned