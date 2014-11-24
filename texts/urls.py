#=====================================================================================================
#Description: urls.py where The URLs are being called.
#=====================================================================================================
#Edited by: Abdullah Mashabi
#Date:10/23/14
#Contact Info: amashabi@kent.edu
#Changes made: Remove reviewing structure from creating a source text. (Ticket #593) 
#			   When adding reviewSourceText functionality, you need to check \translation\texts\views.py
#
#Edited by: Abdullah Mashabi
#Date:		11/21/14
#Contact Info: amashabi@kent.edu
#Changes made: Add the needed functionality to allow the admin view and save the edited source texts. 
#				(Ticket #711) and  (Ticket #710)
#
#=====================================================================================================

from django.conf.urls import patterns, include, url
from texts import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
	#New source entry
    url(r'^enter-new-source/$', views.enterNewSource, name="enterNewSource"),
	#List all source texts
	url(r'^list-of-all-source-texts/$', views.listAllSources, name="listAllSources"),
	#View and edit source texts
	url(r'^source-text/$', views.sourceText, name="sourceText"),
	url(r'^source-text/(?P<sourceTextID>\d+)/$', views.sourceText, name="sourceText"),
	url(r'^save-edit-source/(?P<sourceTextID>\d+)/$', views.saveEditSource, name="saveEditSource"),
	#Review source texts
	#At this point in the project, the review source texts is NOT used. You need to uncomment to do so
    #url(r'^review-source/(\d+)/$', views.reviewSourceText, name="reviewSourceText"), 
    url(r'^review-source-descrepency/(\d+)/$', views.reviewSourceDiscrepency, name="reviewSourceDiscrepency"),

)


#=========================================================================================================================	
# End of urls.py 
#=========================================================================================================================	