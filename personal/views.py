from django.http import HttpResponse
from django.shortcuts import render, render_to_response
from utils import get_user_info
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
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
    # else:
    #     data = {'success': False}
    # jsond = json.dumps(data)
    # return HttpResponse(jsond, content_type='application/json')
    return render(request, 'user_content_ajaxed.html', {'info': user_info}, content_type='application/json')




