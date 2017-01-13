from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms
from personal.models import Person


class UserRegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = ['first_name', 'last_name', 'email', 'username', ]


# class UserEditForm(UserChangeForm):
#     class Meta(UserChangeForm.Meta):
#         fields = ['first_name', 'last_name', 'username', 'password']


class UserEditForm(forms.Form):
    username = forms.CharField()
    first_name = forms.CharField()
    last_name = forms.CharField()

