from django.contrib.auth.models import User

def get_user_info(request, user_id):
    data = {}
    user = User.objects.select_related('personal_detail').get(id=user_id)
    personal = getattr(user, 'personal_detail', None)

    if personal:
        data['userAddress'] = personal.address
        photo = personal.photo
        if photo:
            data['userPhoto'] = photo.url
        else:
            data['userPhoto'] = 'N.A.'
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
        'userLastlogin': user.last_login.__format__('%Y-%m-%d %H:%M'),
        'username': user.username,
    })
    return data
