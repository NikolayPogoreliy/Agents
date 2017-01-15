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
from django.db.utils import IntegrityError
import json
# Create your views here.


def login_view(request):
    """ Приложение для авторизации пользователя
    username и password предаются AJAXом через POST"""
    if request.POST:
        data = {}
        data.update(csrf(request))
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)                                                # Если юзер авторизован
            request.session['info'] = get_user_info(request, request.user.id)   # получаем данные юзера, и сохраняем их в сессии
            return HttpResponse('ok', content_type='text/html')
        else:
            return HttpResponse('Wrong username/password', content_type='text/html')
    else:
        return HttpResponse('Authorizations error', content_type='text/html')


def register_view(request):
    """Приложение для регистрации нового пользователя"""
    data = {}
    data.update(csrf(request))
    data['form'] = UserRegisterForm() # Форма для регистрации нового пользователя
    if request.POST:
        newuser_form = UserRegisterForm(request.POST)
        if newuser_form.is_valid(): # Если все данные валидны - логинимся и переходим к добавлению личных данных
            newuser_form.save()
            newuser = authenticate(username=newuser_form.cleaned_data['username'],
                                   password=newuser_form.cleaned_data['password2'])
            login(request, newuser)
            return redirect('/personal/') # Добавление личных данных пользователя
        else:
            data['form'] = newuser_form
    return render(request, 'register.html', data)


def logout_view(request):
    logout(request)
    return redirect('/')


@login_required()
def user_edit(request):
    """ Приложение для редактирования регистрационных данных пользователя.
    Доступно только после авторизации."""
    data = {}           # Данные для передачи в шаблон
    jsond_data = {}     # Данные для сериализации и отображения через AJAX
    user_info = {}
    data.update(csrf(request))
    # Плучаем данные пользователя
    user = User.objects.get(id=request.user.id)
    # Заполняем форму текущими значениями
    data['form'] = UserEditForm(instance=user)
    if request.POST:
        newuser_form = UserEditForm(request.POST)
        if newuser_form.is_valid():
            user.first_name = request.POST['first_name']    # Обновляем данные пользователя
            user.last_name = request.POST['last_name']      #
            user.username = request.POST['username']        #
            user.save()                                     # И сохраняем пользователя
            user_info = get_user_info(request, request.user.id)  # Заново собираем все данные пользователя
            request.session['info'] = user_info                 # Сохраняем в сессии
            data['info'] = user_info                            # Это будет отправлено в шаблон
            jsond_data['template'] = get_template('user_content_registration.html').render(context=data) # Получаем шаблон пользователя со всеми данными
            jsond_data['info'] = user_info
        else:
            data['form'] = newuser_form             # Форма со всеми сообщениями об ошибках
            jsond_data['template'] = get_template('user-edit.html').render(context=data)    # Получаем шаблон формы
            jsond_data['info'] = user_info          # Пустышка для AJAXа
        jsond = json.dumps(jsond_data)  # Сериализуем в json
        return HttpResponse(jsond, content_type='application/json')  # Отдаем AJAXу для отображения

    return render(request, 'user-edit.html', data)


def password_changing(request):
    """ Изменение пароля (без подтверждения по email)"""
    data = {}
    data.update(csrf(request))
    return authviews.password_change(request)