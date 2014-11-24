#==================================================================================================================
#Description:
#forms.py for new source. This is where the form is being created as well as conditions are set up. 
#==================================================================================================================
#
#Edited by: Abdullah Mashabi
#Date:10/13/14
#Contact Info: amashabi@kent.edu
#Changes made: Add the needed functionalities in the new source entry page. (Ticket #546)
#
#Edited by: Abdullah Mashabi
#Date:		11/18/14
#Contact Info: amashabi@kent.edu
#Changes made: 
#
#==================================================================================================================

from django import forms
from texts.models import Language
from django.core.exceptions import ValidationError


def _getLanguageTuples():
	return map(lambda l: (l.language, l.displayName), Language.objects.all())

class NewSourceTextForm(forms.Form):
	#static fields
	year = forms.CharField(initial='2014', 
			widget=forms.TextInput(attrs={'type': 'number', 'min': '2005', 'max': '2099', 'required': True})) # Year Condition is set in this line.
	#year = forms.ChoiceField(choices = map(lambda y: (y, y), range(2005, 2021))) 
	
	passageLetter = forms.ChoiceField(choices = [("A", "A"), ("B", "B"), ("C", "C")]) # Passage Letter Condition is set in this line.
	
	versionNumber = forms.CharField(initial='1', 
			widget=forms.TextInput(attrs={'type': 'number', 'min': '1', 'max': '999', 'required': True})) # Version Number Condition is set in this line.
			
	setNumber = forms.CharField(initial='1', 
			widget=forms.TextInput(attrs={'type': 'number', 'min': '1', 'max': '5', 'required': True})) # Set Number Condition is set in this line.
			
	sourcePassage = forms.CharField(label='Enter new source here ....', 
			widget=forms.Textarea(attrs={'placeholder': 'Enter new source here ....', 'style': 'height:550px;', 'required': True})) # source Passage Condition is set in this line.


	#dynamic fields
	def __init__(self, *args, **kwargs):
		super(NewSourceTextForm, self).__init__(*args, **kwargs)
		# Source Language
		self.fields["sourceLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "sourceLanguage"}))
		# Target Language
		self.fields["targetLanguage"] = forms.ChoiceField(choices = _getLanguageTuples(), widget=forms.Select(attrs={"id" : "targetLanguage"}))
	
	def clean_sourceLanguage(self):
		sourceLanguage_cleaned = self.cleaned_data.get('sourceLanguage')
		
		# if-statement to check that the versionNumber input is numeric and between the range 1 - 1000
		if sourceLanguage_cleaned == "Arabic":
			raise ValidationError("Please Enter a Valid Numeric Version Number")
		else:
			return sourceLanguage_cleaned
		
	def clean_setNumber(self):
		setNumber_cleaned = self.cleaned_data.get('setNumber')
		
		# if-statement to check that the setNumber input is numeric and between the range 1 - 5
		if not setNumber_cleaned.isnumeric():
		    raise ValidationError("Please Enter a Valid Numeric Set Number.")
		elif setNumber_cleaned > '5':
				raise ValidationError("Up to 5 Sets Are Allowed. Please Enter a Valid Set Number.")
		elif setNumber_cleaned < '1':
				raise ValidationError("Set Number Cannot be Zero. Please Enter a Valid Set Number.")
		elif len(setNumber_cleaned) > 1:
				raise ValidationError("Unpermitted Number of Sets.Please Enter a Valid Set Number.")
		else:
	            return setNumber_cleaned

	def clean_versionNumber(self):
		versionNumber_cleaned = self.cleaned_data.get('versionNumber')
		
		# if-statement to check that the versionNumber input is numeric and between the range 1 - 1000
		if not versionNumber_cleaned.isnumeric():
			raise ValidationError("Please Enter a Valid Numeric Version Number")
		elif versionNumber_cleaned < '1':
			raise ValidationError("Version Number Cannot be Zero. Please Enter a Valid Version Number.")
		elif len(versionNumber_cleaned) > 3:
				raise ValidationError("Unpermitted Number of Versions.Please Enter a Valid Version Number.")
		else:
			return versionNumber_cleaned

class TextReviewForm(NewSourceTextForm):
	comments = forms.CharField(required = False) 
	
#=========================================================================================================================	
# End of forms.py 
#=========================================================================================================================	


