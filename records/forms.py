from django import forms
from django.contrib.auth.models import User, Group
from texts.models import Language, SourceText, Grader, Exam
from userprofile.models import LanguagePair
from django.core.exceptions import ValidationError

#helper methods for the form...should move to utils.py?
def _getSourceTextTuples():
	return map(lambda s: (s.pk, s), SourceText.objects.all())
def _getLanguageTuples():
	return map(lambda l: (l.language, l.displayName), Language.objects.all())
def _getGraderTuples():
    group = Group.objects.get(name='Grader')
    graders = group.user_set.all()
	
    return map(lambda g: (g.id, g.username), graders)

class NewExamForm(forms.Form):
	#static fields
	year = forms.CharField(widget=forms.TextInput(attrs={"id" : "year"}))
	examNumber = forms.CharField()
	secondPassage  = forms.ChoiceField(choices = [("B", "B"), ("C", "C")])

	def __init__(self, *args, **kwargs):
		super(NewExamForm, self).__init__(*args, **kwargs)

		#dynamically create fields for the form so that the choices can be updated without restarting the server
		for i in range(4):
			self.fields["grader{0}".format(i+1)] = forms.ChoiceField(choices = _getGraderTuples())

		for i in range(2):
			self.fields["sourceText{0}".format(i+1)] = forms.ChoiceField(choices = _getSourceTextTuples(), widget=forms.Select(attrs={"id" : "sourceText{0}".format(i+1)}))

		self.fields["sourceLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "sourceLanguage"}))
		self.fields["targetLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "targetLanguage"}))

	def clean_year(self):
		year_cleaned = self.cleaned_data.get('year')

		if not year_cleaned.isnumeric():
			raise ValidationError("Please enter a valid year")
		else:
			return year_cleaned

	def clean_examNumber(self):
		examNumber_cleaned = self.cleaned_data.get('examNumber')

		if not examNumber_cleaned.isnumeric():
			raise ValidationError("Please enter a valid exam number.")
		elif Exam.objects.filter(examNumber = examNumber_cleaned).count() != 0:
			raise ValidationError("That exam number is already in use.")
		else:
			return examNumber_cleaned
			



