from django.db import models
from django.forms import ModelForm
from django import forms
from django.template import RequestContext

RETURN_CHOICES = (
	('TEXT', 'Text'),
	('IMG', 'Image'),
	('CUSTOM','Custom')
)

class RFunctions(models.Model):
	Name = models.CharField(max_length = 500)
	Description = models.CharField(max_length = 500)
	Body = models.TextField()
	ReturnType = models.CharField(max_length = 500, choices = RETURN_CHOICES)

	def __unicode__(self):
                return unicode(self.Name)

class RParamaters(models.Model):
	RFunction = models.ForeignKey('RFunctions')
	SequenceNumber = models.PositiveSmallIntegerField()
	parameter = models.CharField(max_length=50)


# Create your models here.

class RFunctionForm(forms.Form):
	id = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
	Name = forms.CharField(max_length = 500)
	Description = forms.CharField(max_length = 500)
	Body = forms.CharField( widget=forms.Textarea(attrs={'rows':12,
                                            'style':'resize:vertical;'}))
	ReturnType = forms.ChoiceField(widget=forms.HiddenInput(), choices = RETURN_CHOICES)
