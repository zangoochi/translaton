#=====================================================================================================
#Description:
#Urls for creating a new user, logging a user in, logging a user out along with changing a users email. 
#To change a users password, the urls are in translation_mockup/urls.py and their templates are in 
#translation_mockup/templates/registration
#=====================================================================================================

#Edited by: Zach Montgomery
#Date: 10/22/14 
#contact info: zmontgom@kent.edu
#Changes made: created change-email url call the change_email view in login/views.py
#=====================================================================================================


from django.conf.urls import patterns, include, url
from login import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
	url(r'^authenticate/$', views.authenticateAndLoginUser, name="authenticateAndLoginUser"),
	url(r'^logout/$', views.logoutUser, name="logout"),
    url(r'^change-email/$', views.change_email, name="change_email"),
)