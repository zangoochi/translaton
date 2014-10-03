from django.conf.urls import patterns, include, url
from texts import views

urlpatterns = patterns('',
    url(r'^$', views.index, name="index"),
    url(r'^enter-new-source/$', views.enterNewSource, name="enterNewSource"),
    url(r'^review-source/(\d+)/$', views.reviewSourceText, name="reviewSourceText"),
    url(r'^review-source-descrepency/(\d+)/$', views.reviewSourceDiscrepency, name="reviewSourceDiscrepency"),
    url(r'^list-of-all-source-texts/$', views.listAllSources, name="listAllSources"),
)