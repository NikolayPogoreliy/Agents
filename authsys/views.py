from django.shortcuts import render, redirect, render_to_response
from django.http import HttpResponse
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.forms import UserCreationForm
from .forms import UserRegisterForm, UserPersonalForm
from django.core.context_processors import csrf

# Create your views here.
def login_view(request):
    #print('login_view called')
    if request.POST:
        #print('POST')
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            request.session['user'] = user.id
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
            return redirect('/auth/personal/')
        else:
            data['form']= newuser_form

    return render(request,'register.html', data)


def logout_view(request):
    logout(request)
    return redirect('/')

def personal_view(request):
    data = {}
    print(request.user)
    data.update(csrf(request))
    data['form'] = UserPersonalForm()
    if request.POST:
        newuser_form = UserPersonalForm(request.POST, request.FILES)
        if newuser_form.is_valid():
            newuser_form.user = request.user
            newuser_form.save()
            return redirect('/user/?user_id={}'.format(request.user.id))
        else:
            data['form'] = newuser_form

    return render(request, 'personal.html', data)