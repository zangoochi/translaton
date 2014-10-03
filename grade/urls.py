from django.conf.urls import patterns, include, url
from grade import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    url(r'^exam/$', views.gradeExam, name="gradeExam"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/$', views.gradeExam, name="gradeExam"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/saveHtml/$', views.saveHighHTML, name="saveHighHTML"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/error/$', views.errorWithoutID, name="errorWithoutID"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/error/(?P<errorID>\d+)/$', views.errorWithID, name="errorWithID"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/highlight/$', views.insertHighlightJSON, name="insertHighlightJSON"),
    url(r'^exam/(?P<examNumber>\d+)/(?P<passageLetter>[ABCabc])/finalize/$', views.finalizeGrading, name="finalizeGrading"),
    url(r'^discrepancy-review/(?P<discrepancyID>\d+)/$', views.discrepancyReview, name="discrepancyReview")
)