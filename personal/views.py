from django.http import HttpResponse
from django.shortcuts import render, redirect, render_to_response
from utils import get_user_info
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.core.context_processors import csrf
from personal.forms import UserPersonalForm, UserPersonalEditForm
from personal.models import Person
import json

# Create your views here.


def base_view(request):
    # print(request.user.is_authenticated())
    if request.user.is_authenticated():
        data = {}
        data['users'] = User.objects.exclude(is_superuser=True).order_by('last_name', 'first_name')
        try:
            data['info'] = request.session['info']
        except:
            pass

        return render(request, 'user_content.html', data)
    else:
        return render(request, 'greating.html')

@login_required()
def user_view(request):
    user_info = {}
    request.session['info'] = user_info
    if request.method == 'GET':
        user_id = request.GET['user_id']
        user_info = get_user_info(request, user_id)
        request.session['info'] = user_info
    else:
        user_info = {'success': False}
    # print(user_info)
    jsond = json.dumps(user_info)

    return HttpResponse(jsond, content_type='application/json')
    # return render(request, 'user_content_ajaxed.html', {'info': user_info}, content_type='application/json')


@login_required()
def person_create(request):
    data = {}
    print(request.user)
    data.update(csrf(request))
    data['form'] = UserPersonalForm()
    if request.POST:
        newuser_form = UserPersonalForm(request.POST, request.FILES)
        if newuser_form.is_valid():
            newuser_form.user = request.user
            newuser_form.save()
            request.session['info'] = get_user_info(request, request.user.id)
            return redirect('/')
        else:
            data['form'] = newuser_form

    return render(request, 'personal.html', data)


@login_required()
def person_edit(request):
    data = {}

    data.update(csrf(request))
    user = Person.objects.get(user=request.user.id)
    data['form'] = UserPersonalEditForm(initial={'address': user.address, 'photo': user.photo})

    if request.POST:
        newuser_form = UserPersonalEditForm(request.POST, request.FILES)
        if newuser_form.is_valid():
            user.address = newuser_form.cleaned_data['address']
            try:
                user.photo = request.FILES['photo']
            except:
                pass
            user.save()
            request.session['info'] = get_user_info(request, request.user.id)
            return redirect('/')
        else:
            data['form'] = newuser_form

    return render(request, 'personal-edit.html', data)
