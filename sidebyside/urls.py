from django.conf.urls import patterns, include, url
from sidebyside import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    url(r'^source-text/$', views.sourceText, name="sourceText"),
    url(r'^target-text/$', views.targetText, name="targetText"),
	url(r'^source-text/(?P<sourceTextID>\d+)/$', views.sourceText, name="sourceText"),
	url(r'^target-text/(?P<targetTextID>\d+)/$', views.targetText, name="targetText"),
)