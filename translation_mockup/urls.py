from django.conf.urls import patterns, include, url
from django.contrib import admin
import login

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', 'translation_mockup.views.index'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^side-by-side/', include('sidebyside.urls', namespace="sidebyside")),
    url(r'^profile/', include('userprofile.urls', namespace="userprofile")),
    url(r'^texts/', include('texts.urls', namespace="texts")),
    url(r'^records/', include('records.urls', namespace="records")),
    #url(r'^analysis/', include('analysis.urls', namespace="analysis")),
    url(r'^grade/', include('grade.urls', namespace="grade")),
	url(r'^login/', include('login.urls', namespace="login")),
    url(r'^cegroups/', include('cegroups.urls', namespace="cegroups")),
    url(r'^(\w+)/$', 'translation_mockup.views.workFlow'),  
    url(r'^accounts/password-change/$', 'django.contrib.auth.views.password_change', name='password_change'),
    url(r'^accounts/password-change/done/$', 'django.contrib.auth.views.password_change_done', name='password_change_done')
)
