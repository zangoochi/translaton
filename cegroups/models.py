# =====================================================================================================
# Created by: Brandon Kessell
# Date: 13-OCT-2014
# Version: 1.0
# Contact info: bkessell@kent.edu
# Description:
# All models used by the cegroups application
# =====================================================================================================
from django.db import models
from django.contrib.auth.models import Group

# Model used to hold permission options such as "Read-only", "None", "Full"
class permOptions(models.Model):
	description = models.CharField(max_length=255)

	def __unicode__(self):
		return self.description

# Model used to hold objects such as buttons or values on the page
class permObjects(models.Model):
	objectName = models.CharField(max_length=255)

	def __unicode__(self):
		return self.objectName

# Model used to hold the permissions a group has
class groupPermissions(models.Model):
	groupId = models.ForeignKey(Group, null=True, related_name='+')
	permObject = models.ForeignKey(permObjects)

# Model used to hold hierachy of objects such as buttons belonging to a menu
class permObjectParent(models.Model):
	parentObject = models.ForeignKey(permObjects, null=True, related_name='+')
	childObject = models.ForeignKey(permObjects, null=True, related_name='+')