import random
from django.conf import settings


class ImageUploaderMixin:
    def set_path(self, filename):
        folder = self.user.first_name+self.user.last_name+'_'+str(self.personal_id)
        return '{}/{}/{}'.format(settings.IMAGE_UPLOAD_DIR, folder, filename)
