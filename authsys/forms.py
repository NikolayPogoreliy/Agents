from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm
from personal.models import Person


class UserRegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = ['first_name', 'last_name', 'email', 'username', ]


class UserPersonalForm(ModelForm):
    class Meta:
        model = Person
        fields = '__all__'
