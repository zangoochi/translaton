#=====================================================================================================
#Description:
#Urls for admin interaction. This includes creating, editing, deleting users, objects, permissions, etc.
#=====================================================================================================

#Edited by: Zach Montgomery
#Date: 10/30/14 
#contact info: zmontgom@kent.edu
#Changes made: created change-email url call the change_email view in cegroups/views.py. The url takes 
#					the user id and passes it along in the url to be used in changing different users info
#=====================================================================================================


from django.conf.urls import patterns, include, url
from cegroups import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    url(r'^savepermoption/$', views.savePermissionOption, name="savePermissionOption"),
    url(r'^saveuseroption/$', views.saveUserOption, name="saveUserOption"),
    url(r'^edituseroption/$', views.editUserOption, name="editUserOption"),
    url(r'^removepermissionoption/$', views.removePermissionOption, name="removePermissionOption"),
    url(r'^removeuseroption/$', views.removeUserOption, name="removeUserOption"),

)