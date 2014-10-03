from django import forms

class ChangePasswordForm(forms.Form):
	oldPassword = forms.CharField(max_length = 32)
	newPassword = forms.CharField(max_length = 32)
	newPasswordConfirmation = forms.CharField(max_length = 32)