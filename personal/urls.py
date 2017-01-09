from django.conf.urls import url

from django.contrib.auth.views import login

urlpatterns = [

    url(r'^user/$', 'personal.views.user_view', name='user'),
    url(r'^$', 'personal.views.base_view', name='home'),

]