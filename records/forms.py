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
	year = forms.CharField(initial='2014', 
			widget=forms.TextInput(attrs={"id" : "year", 'type': 'number', 'min': '2005', 'max': '2099', 'required': True})) # Year Condition is set in this line.
	#year = forms.CharField(widget=forms.TextInput(attrs={"id" : "year"}))
	
	examNumber = forms.CharField(initial='00001', widget=forms.TextInput) # Exam Number Condition is set in this line.
	
	secondPassage  = forms.ChoiceField(choices = [("B", "B"), ("C", "C")])

	#dynamic fields
	def __init__(self, *args, **kwargs):
		super(NewExamForm, self).__init__(*args, **kwargs)

		self.fields['grader1'] = forms.ChoiceField(choices = _getGraderTuples())
		self.fields['grader2'] = forms.ChoiceField(choices = _getGraderTuples())
		self.fields['grader3'] = forms.ChoiceField(choices = _getGraderTuples())
		self.fields['grader4'] = forms.ChoiceField(choices = _getGraderTuples())


		for i in range(2):
			self.fields["sourceText{0}".format(i+1)] = forms.ChoiceField(choices = _getSourceTextTuples(), widget=forms.Select(attrs={"id" : "sourceText{0}".format(i+1)}))

		self.fields["sourceLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "sourceLanguage"}))
		self.fields["targetLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "targetLanguage"}))

	def clean_year(self):
		year_cleaned = self.cleaned_data.get('year')

		# if-statement to check that the year input is numeric
		if not year_cleaned.isnumeric():
			raise ValidationError("Please enter a valid year")
		else:
			return year_cleaned

	def clean_examNumber(self):
		examNumber_cleaned = self.cleaned_data.get('examNumber')

		# if-statement to check that the examNumber input is numeric, not in use, and five-digit integer
		if not examNumber_cleaned.isnumeric():
			raise ValidationError("Please enter a valid exam number.")
		elif Exam.objects.filter(examNumber = examNumber_cleaned).count() != 0:
			raise ValidationError("That exam number is already in use.")
		elif len(examNumber_cleaned) > 5:
				raise ValidationError("Exam Number is Unpermitted.Please Enter a Exam Set Number.")
		elif len(examNumber_cleaned) < 5:
				raise ValidationError("Exam Number is Unpermitted.Please Enter a Exam Set Number.")
		else:
			return examNumber_cleaned

	def clean_grader2(self):
		grader1 = self.cleaned_data.get('grader1')
		grader2 = self.cleaned_data.get('grader2')

		if grader1 == grader2:
			raise forms.ValidationError("Grader 1 and Grader 2 must be different")
		return grader2



