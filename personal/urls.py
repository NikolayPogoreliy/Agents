from django.conf.urls import url

from django.contrib.auth.views import login

urlpatterns = [

    #url(r'^user/(?:(?P<user_id>\d*)/)$', 'personal.views.user_view', name='user'),
    url(r'^user/$', 'personal.views.user_view', name='user'),
    #url(r'^login/$', login_view, name='login'),
    url(r'^$', 'personal.views.base_view', name='home'),

]