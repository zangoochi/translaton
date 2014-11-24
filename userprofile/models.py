from django.db import models
from django.contrib.auth.models import User
from texts.models import Language

class LanguagePair(models.Model):
    user = models.ForeignKey(User)
    language = models.ForeignKey(Language, related_name='+')
    
    class Meta:
        unique_together = ['user', 'language']

    def __unicode__(self):
        return "{0} --- {1}".format(self.user.username, self.language.language)


