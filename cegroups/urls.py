#=====================================================================================================
#Description:
#Urls for admin interaction. This includes creating, editing, deleting users, objects, permissions, etc.
#=====================================================================================================

#Edited by: Zach Montgomery
#Date: 10/30/14
#contact info: zmontgom@kent.edu
#1st Changes made: created change-email url call the change_email view in cegroups/views.py. The url takes
#					the user id and passes it along in the url to be used in changing different users info
#
#Edited by: Abdullah Mashabi
#Date:10/31/14
#Contact Info: amashabi@kent.edu
#2nd Changes made: created saveGroupOption url for the groups section in cegroups/views.py
#                  to create a new group as well as edit it as needed (Ticket #632).
#
#Created by: Abdullah Mashabi
#Date:11/09/14
#Contact Info: amashabi@kent.edu
#2nd Changes made: Added saveGroupPermission and editGroupOption urls for the groups section in cegroups/views.py  
#                  to set group permissions based on the objects permissions. 
#                  (Ticket #651) 
#
#=====================================================================================================


from django.conf.urls import patterns, include, url
from cegroups import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    #User
    url(r'^saveuseroption/$', views.saveUserOption, name="saveUserOption"),
    url(r'^edituseroption/$', views.editUserOption, name="editUserOption"),
    url(r'^removeuseroption/$', views.removeUserOption, name="removeUserOption"),
    #Groups
    url(r'^savegroupoption/$', views.saveGroupOption, name="saveGroupOption"),
    url(r'^removegroupoption/$', views.removeGroupOption, name="removeGroupOption"),
    url(r'^editgroupoption/$', views.editGroupOption, name="editGroupOption"),
    url(r'^savegrouppermission/$', views.saveGroupPermission, name="saveGroupPermission"),
    #Permission Types
    url(r'^savepermoption/$', views.savePermissionOption, name="savePermissionOption"),
    url(r'^removepermissionoption/$', views.removePermissionOption, name="removePermissionOption"),
    #Permission Objects
    url(r'^savepermobject/$', views.savePermissionObject, name="savePermissionObject"),
    url(r'^removepermissionobject/$', views.removePermissionObject, name="removePermissionObject"),
)
