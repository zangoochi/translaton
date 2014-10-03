from django import forms
from texts.models import Language
from django.core.exceptions import ValidationError


def _getLanguageTuples():
	return map(lambda l: (l.language, l.displayName), Language.objects.all())

class NewSourceTextForm(forms.Form):

	#static fields
	year = forms.ChoiceField(choices = map(lambda y: (y, y), range(2005, 2021)))
	passageLetter = forms.ChoiceField(choices = [("A", "A"), ("B", "B"), ("C", "C")])
	versionNumber = forms.CharField()
	setNumber     = forms.CharField()
	sourcePassage = forms.CharField(widget=forms.Textarea)

	#dynamic fields
	def __init__(self, *args, **kwargs):
		super(NewSourceTextForm, self).__init__(*args, **kwargs)

		self.fields["sourceLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "sourceLanguage"}))
		self.fields["targetLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "targetLanguage"}))

	def clean_setNumber(self):
		setNumber_cleaned = self.cleaned_data.get('setNumber')

		if not setNumber_cleaned.isnumeric():
			if setNumber > 10:
			    raise ValidationError("Please Enter a Valid Set Number")
		else:
			return setNumber_cleaned

	def clean_versionNumber(self):
		versionNumber_cleaned = self.cleaned_data.get('versionNumber')

		if not versionNumber_cleaned.isnumeric():
			raise ValidationError("Please Enter a Valid Version Number")
		else:
			return versionNumber_cleaned

class TextReviewForm(NewSourceTextForm):
	
	comments = forms.CharField(required = False) 



