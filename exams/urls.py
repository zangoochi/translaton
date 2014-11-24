from django.conf.urls import patterns, include, url
from exams import views

urlpatterns = patterns('',
    #url(r'^$', views.index, name="index"),
    url(r'^enter-exam/$', views.enterExam, name="enterExam")
)