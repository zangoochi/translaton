#=====================================================================================================
#Description:
#Urls for exam records
#=====================================================================================================

#Edited by: Zach Montgomery
#Date: 10/22/14 
#contact info: zmontgom@kent.edu
#Changes made: commented out the verify-exam-record url. This url would be used for verifying target texts.
#				Since we are taking the project to its simplest form, this is not needed. 
#=====================================================================================================


from django.conf.urls import patterns, include, url
from records import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    url(r'^enter-exam-record/$', views.enterExamRecord, name="enterExamRecord"),
    url(r'^enter-exam-record/(?P<examNumber>\d+)/(?P<passageNumber>[12])/$', views.enterExamRecord, name="enterExamRecord"),
    #url(r'^verify-exam-record/(?P<examNumber>\d+)/(?P<passageNumber>[12])/$', views.verifyExamRecord, name="verifyExamRecord"),
    url(r'^list-all-qued-records/$', views.listAllQuedRecords, name="listAllQuedRecords"),
	url(r'^enter-exam/$', views.enterNewExam, name="enterNewExam"),
	url(r'^enter-exam/upload-pdf/$', views.uploadPDF, name="uploadPDF"),
)