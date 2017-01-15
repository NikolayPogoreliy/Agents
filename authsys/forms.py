from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User
from django import forms
from personal.models import Person


class UserRegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = ['first_name', 'last_name', 'email', 'username', ]


class UserEditForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username']
        exclude = ['password']

# class UserEditForm(forms.Form):
#     username = forms.CharField()
#     first_name = forms.CharField()
#     last_name = forms.CharField()

