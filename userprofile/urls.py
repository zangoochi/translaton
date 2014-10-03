from django.conf.urls import patterns, include, url
from userprofile import views

urlpatterns = patterns('',
	#1rst following url will be deleted once login is in place
    url(r'^$', views.tempIndex, name="index"),
    url(r'^(\w+)/$', views.index, name="index"),
)