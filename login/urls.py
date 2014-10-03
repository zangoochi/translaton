from django.conf.urls import patterns, include, url
from login import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
	url(r'^authenticate/$', views.authenticateAndLoginUser, name="authenticateAndLoginUser"),
	url(r'^logout/$', views.logoutUser, name="logout"),
    url(r'^create-user/$', views.createUser, name="createUser"),
)