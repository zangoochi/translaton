from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Exam(models.Model):
	examNumber = models.CharField(max_length=5)
	grader1 = models.ForeignKey(User, related_name='+')
	grader2 = models.ForeignKey(User, related_name='+')
	passed = models.NullBooleanField()
	sourceText1 = models.ForeignKey('texts.SourceText', related_name='+')
	sourceText2 = models.ForeignKey('texts.SourceText', related_name='+')
	targetText1 = models.ForeignKey('texts.TargetText', related_name='+')
	targetText2 = models.ForeignKey('texts.TargetText', related_name='+')
	language    = models.ForeignKey('texts.Language', related_name='+')

	def __unicode__(self):
		return "EXAM # {0}".format(self.examNumber)
 