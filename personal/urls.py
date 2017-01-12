from django.conf.urls import url

from django.contrib.auth.views import login

urlpatterns = [

    url(r'^user/$', 'personal.views.user_view', name='user'),
    url(r'^personal/$', 'personal.views.person_create', name='create-person'),
    url(r'^personal-edit/$', 'personal.views.person_edit', name='edit-person'),
    url(r'^$', 'personal.views.base_view', name='home'),

]