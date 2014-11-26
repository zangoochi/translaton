from django.conf.urls import patterns, include, url
from analysis import views

urlpatterns = patterns('',
    url(r'generateGraph.*$', views.generateGraph, name="generateGraph"),
    url(r'getParams.*$', views.getParams, name="getParams"),
    url(r'keywords/(?P<query>.*)/$', views.getKeywords, name="getKeywords"),
    url(r'rDesigner/$', views.rDesigner, name="rDesigner"),
    url(r'rDeletion/$', views.rDeletion, name="rDeletion"),
    url(r'getFunctionData.*$', views.getFunctionData, name="getFunctionData"),
    url(r'getFunctionParms.*$', views.getFunctionParms, name="getFunctionParms"),

    url(r'executeRFunction.*$', views.executeRFunction, name="executeRFunction"),
    url(r'rEdit/$', views.rEdit, name="rEdit"),
    url(r'rCreate/$', views.rCreate, name="rCreate"),
    url(r'^$', views.index, name="index"),
)
