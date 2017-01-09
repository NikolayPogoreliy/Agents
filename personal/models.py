from django.db import models
from django.contrib.auth.models import User
from mixins import ImageUploaderMixin

# Create your models here.


class Person(models.Model, ImageUploaderMixin):
    user = models.OneToOneField(User, verbose_name='Пользователь', related_name='personal_detail')
    address = models.CharField(max_length=100, blank=True, null=True, verbose_name='Адресс')
    photo = models.ImageField(upload_to=ImageUploaderMixin.set_path, default='', blank=True, null=True, verbose_name='Фото')
    personal_id = models.CharField(max_length=20, blank=True, editable=False)

    def __str__(self):
        return self.user.username

    def pic(self):
        if self.photo:
            return '<img src = "%s" width="40px" />' % self.photo.url

    pic.short_description = 'Фото'
    pic.allow_tag = True

    def save(self, *args, **kwargs):
        if not self.personal_id:
            self.personal_id = self.set_personal_id()
        return super(Person, self).save(*args, **kwargs)

    def set_personal_id(self):
        from random import randint
        return str(int(sum([ord(c) for c in self.user.last_name])/len(self.user.last_name)))+'_'+str(randint(0,1000))

    class Meta:
        verbose_name = 'Пользователи'
        verbose_name_plural = 'Пользователи'
