from django.conf.urls import url

urlpatterns = [

    url(r'^login/', 'authsys.views.login_view', name="login"),
    url(r'^logout/', 'authsys.views.logout_view', name="logout"),
    url(r'^register/', 'authsys.views.register_view', name="register"),
    url(r'^edit/', 'authsys.views.user_edit', name="edit-user"),
    # url(r'^personal/', 'authsys.views.personal_view', name="personal"),
    # url(r'^personal-edit/', 'authsys.views.personal_edit_view', name="personal"),
]