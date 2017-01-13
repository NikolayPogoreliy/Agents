from django.shortcuts import render, redirect, render_to_response
from django.http import HttpResponse
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserEditForm
from django.core.context_processors import csrf
from utils import get_user_info
# Create your views here.


def login_view(request):
    #print('login_view called')
    if request.POST:
        data = {}
        data.update(csrf(request))
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            request.session['info'] = get_user_info(request, request.user.id)
            return HttpResponse('ok', content_type='text/html')
        else:
            return HttpResponse('Wrong username/password', content_type='text/html')
    else:
        return HttpResponse('Authorizations error', content_type='text/html')


def register_view(request):
    data = {}
    data.update(csrf(request))
    data['form'] = UserRegisterForm()
    if request.POST:
        newuser_form = UserRegisterForm(request.POST)
        if newuser_form.is_valid():
            newuser_form.save()
            newuser = authenticate(username=newuser_form.cleaned_data['username'], password=newuser_form.cleaned_data['password2'])
            login(request, newuser)
            return redirect('/personal/')
        else:
            data['form'] = newuser_form

    return render(request, 'register.html', data)


def logout_view(request):
    logout(request)
    return redirect('/')


@login_required()
def user_edit(request):
    data = {}
    print('user_edit called')
    data.update(csrf(request))
    user = User.objects.get(id=request.user.id)
    data['form'] = UserEditForm(initial={'username': user.username,
                                         'first_name': user.first_name,
                                         'last_name': user.last_name})

    if request.POST:
        newuser_form = UserEditForm(request.POST)
        if newuser_form.is_valid():
            user.first_name = newuser_form.cleaned_data['first_name']
            user.last_name = newuser_form.cleaned_data['last_name']
            user.username = newuser_form.cleaned_data['username']
            user.save()
            request.session['info'] = get_user_info(request, request.user.id)
            return redirect('/')
        else:
            data['form'] = newuser_form

    return render(request, 'user-edit.html', data)
