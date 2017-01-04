from django.http import HttpResponse
from django.shortcuts import render
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth import login, authenticate
import json

# Create your views here.
def  base_view(request):
    return render(request, 'index.html', {'users': User.objects.exclude(is_superuser=True)})

def user_view(request):
    data = {}
    request.session['data'] = data
    if request.method == 'GET':
        user_id = request.GET['user_id']
        user = User.objects.select_related('personal_detail').get(id=user_id)
        personal = getattr(user, 'personal_detail', None)

        if personal:
            data['userAddress'] = personal.address
            data['userPhoto'] = str(personal.photo)
            data['userID'] = personal.personal_id
        else:
            data['userAddress'] = 'N.A.'
            data['userPhoto'] = 'N.A.'
            data['userID'] = 'N.A'
            

        if user.is_staff:
            data['userStatus'] = 'Administrator'
        else:
            data['userStatus'] = 'Personnel'

        if request.user.is_authenticated and str(request.user.id) == str(user_id):
            data['userInfo'] = 'me'
        else:
            data['userInfo'] = user_id
        data.update({
            'success': True,
            'userFirstname': user.first_name,
            'userLastname': user.last_name,
            'userEmail': user.email,
            'userLastlogin': str(user.last_login),
            })
        request.session['data'] = data
    else:
        data = {'success': False}
    jsond = json.dumps(data)
    return HttpResponse(jsond, content_type='application/json')




