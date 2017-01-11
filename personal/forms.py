from django.forms import ModelForm
from personal.models import Person



class UserPersonalForm(ModelForm):
    class Meta:
        model = Person
        fields = '__all__'
