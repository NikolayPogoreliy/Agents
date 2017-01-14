from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.template.loader import get_template
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.contrib.auth import views as authviews
from .forms import UserRegisterForm, UserEditForm
from django.core.context_processors import csrf
from django.core.mail import send_mail
from utils import get_user_info
import json
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
    render_data = {}
    print('user_edit called')
    data.update(csrf(request))
    user = User.objects.get(id=request.user.id)
    data['form'] = UserEditForm(initial={'username': user.username,
                                         'first_name': user.first_name,
                                         'last_name': user.last_name})

    if request.POST:
        newuser_form = UserEditForm(request.POST)
        if newuser_form.is_valid():
            user.first_name = request.POST['first_name']#newuser_form.cleaned_data['first_name']
            user.last_name = request.POST['last_name']#newuser_form.cleaned_data['last_name']
            user.username = request.POST['username']#newuser_form.cleaned_data['username']
            user.save()
            user_info = get_user_info(request, request.user.id)
            request.session['info'] = user_info
            render_data['template'] = get_template('user_content_registration.html').render(context={'info': user_info})
            render_data['info'] = user_info
            jsond = json.dumps(render_data)
            # return redirect('/')
            return HttpResponse(jsond, content_type='application/json')
        else:
            data['form'] = newuser_form

    return render(request, 'user-edit.html', data)


def password_changing(request):
    data={}
    #send_mail('subj','mess','from@example.com',['to@example.com'], fail_silently=False)
    data.update(csrf(request))
    return authviews.password_change(request)#,  post_change_redirect='/auth/logout')