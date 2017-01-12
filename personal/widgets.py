from django.forms.widgets import ClearableFileInput


class ClearableImageInput(ClearableFileInput):
    template_with_initial = (
        '%(initial_text)s: <a href="%(initial_url)s"><img src="/media/%(initial)s" width="70px" alt="NO PHOTO"></a> '
        '%(clear_template)s<br />%(input_text)s: %(input)s'
    )