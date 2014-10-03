from django.conf.urls import patterns, include, url
from analysis import views

urlpatterns = patterns('',
    url(r'generateGraph.*$', views.generateGraph, name="generateGraph"),
    url(r'getParams.*$', views.getParams, name="getParams"),
    url(r'keywords/(?P<query>.*)/$', views.getKeywords, name="getKeywords"),
    url(r'gradedExams/$', views.gradedExams, name="gradedExams"),
    url(r'^$', views.index, name="index"),
)
