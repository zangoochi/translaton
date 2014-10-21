from django import forms
from django.contrib.auth.models import User


CHOICES = (
(('grader','Grader'), ('testTaker','Test Taker'))
)

class NewUserForm(forms.Form):
    error_css_class = 'error'
    
    username = forms.CharField(label="username", required=True)
    password = forms.CharField(widget=forms.PasswordInput(), required=True)
    first_name = forms.CharField(label="First Name")
    last_name = forms.CharField(label="Last Name")
    email = forms.EmailField()
    group = forms.ChoiceField(choices=CHOICES, widget=forms.Select(), required=True)
