from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.template.loader import get_template
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.core.context_processors import csrf
from personal.forms import UserPersonalForm, UserPersonalEditForm
from personal.models import Person
from utils import get_user_info
import json

# Create your views here.


def base_view(request):
    """Базовое представление: если юзер не авторизован - выдает страницу авторизации
     иначе - выборку по всем пользователям и страницу с данными вошедшего"""
    if request.user.is_authenticated(): # Если пользователь вошел на сайт -
        data = {}
        data['users'] = User.objects.exclude(is_superuser=True).order_by('last_name', 'first_name')  # получаем всех пользователей (кроме супера)
        try:
            data['info'] = request.session['info']  # получаем данные вошедшего пользователя для отображения
        except:
            pass
        return render(request, 'user_content.html', data) # рендерим страницу с данными пользователя
    else:
        return render(request, 'greating.html') # Иначе рендерим страницу авторизации/регистрации

@login_required()
def user_view(request):
    """ Представление для получения данных запрошеного пользователя"""
    data = {}
    user_info = {}
    curr_user = request.session['info']['userInfo']
    request.session['info'] = user_info     # Обновляем данные пользователя в сессии (стираем)
    if request.method == 'GET':
        user_id = request.GET.get('user_id', request.user.id)
        user_info = get_user_info(request, user_id)     # Получаем данные запрошенного пользователя
        data['user_info'] = user_info
        if curr_user == 'me':   # Если уходим со своей страницы - обновляем содержимое соответствующих разделов
            data['reg_template'] = get_template('user_content_registration.html').render()
            data['pers_template'] = get_template('user_content_personal.html').render()
        request.session['info'] = user_info  # и сохраняем данные пользователя в сессии
    else:
        # user_info = {'success': False}
        data['success'] = False
    # jsond = json.dumps(user_info)           # Сериализуем и отдаем AJAXу
    jsond = json.dumps(data)
    return HttpResponse(jsond, content_type='application/json')



@login_required()
def person_create(request):
    """ Представление для ввода личных данных пользователя"""
    data = {}
    data.update(csrf(request))
    data['form'] = UserPersonalForm()
    if request.POST:
        newuser_form = UserPersonalForm(request.POST, request.FILES)    # Форма содержит так-же поле для выбора изображений
        if newuser_form.is_valid():
            newuser_form.user = request.user                            # Добавляем в форму id текущего пользователя
            newuser_form.save()
            request.session['info'] = get_user_info(request, request.user.id)   # Сохраняем обновленные данные пользователя в сессии
            return redirect('/')                                                # Переходим на главную страницу
        else:
            data['form'] = newuser_form
    return render(request, 'personal.html', data)


@login_required()
def person_edit(request):
    """Представление для редактирования личных данных пользователя"""
    data = {}
    data.update(csrf(request))
    user = Person.objects.get(user=request.user.id)     # Получаем запрошенного поьзователя
    data['form'] = UserPersonalEditForm(initial={'address': user.address, 'photo': user.photo})     # Заполняем форму текущими данными пользователя
    if request.POST:
        newuser_form = UserPersonalEditForm(request.POST, request.FILES)
        if newuser_form.is_valid():
            user.address = newuser_form.cleaned_data['address']
            try:
                user.photo = request.FILES['photo']         # Фото берем из request.FILES!!!
            except:
                pass
            user.save()
            request.session['info'] = get_user_info(request, request.user.id) # Обновляем данные в сессии
            return redirect('/')    # Переходим на главную
        else:
            data['form'] = newuser_form
    return render(request, 'personal-edit.html', data)


def canceling(request):
    """ Представление для отмены редактирования:
        при отмене будет перезагружена не вся страница, а только соответствующий раздел (исп. AJAX)"""
    user_info = {}
    data = {}
    container = ''  # Какой контент перезагружать - "персональные данные" или "регистрационнные"
    request.session['info'] = user_info  # Очищаем данные в сессии
    if request.method == 'GET':
        container = request.GET['container']    # Плучаем id контента
        user_info = get_user_info(request, request.user.id)     # Получаем данные пользователя
        request.session['info'] = user_info                     # и сохраняем их в сессии
    if container == 'registration':     # Если закрываем форму редактирования регистрационных данных - обновляем div с регистрационными данными
        data['template'] = get_template('user_content_registration.html').render(context={'info': user_info})
    else:       # Иначе - обновляем div с персональными данными
        data['template'] = get_template('user_content_personal.html').render(context={'info':user_info})
    data['container'] = '#' + container + '-info'   # формируем id соответствующего div
    jsond = json.dumps(data)                        # Упаковываем в json
    return HttpResponse(jsond, content_type='application/json') # Отдаем AJAXу для отображения
