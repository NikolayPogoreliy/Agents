from django.contrib.auth.forms import UserCreationForm
from django.forms import ModelForm
from personal.models import Person


class UserRegisterForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        fields = ['first_name', 'last_name', 'email', 'username', ]


