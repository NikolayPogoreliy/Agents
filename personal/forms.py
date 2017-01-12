# from django.forms import ModelForm, Form
from personal.models import Person
from django import forms
from django.forms.widgets import ClearableFileInput
from personal.widgets import ClearableImageInput


class UserPersonalForm(forms.ModelForm):
    class Meta:
        model = Person
        fields = '__all__'


class UserPersonalEditForm(forms.Form):
    address = forms.CharField()
    photo = forms.ImageField(widget=ClearableImageInput, required=False)

