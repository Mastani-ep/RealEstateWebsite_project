from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django import forms
from django.contrib.auth.models import User
from captcha.fields import ReCaptchaField
from captcha.widgets import ReCaptchaV2Checkbox

class RegisterForm(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(required=True)
    last_name = forms.CharField(required=True)
    captcha = ReCaptchaField(label='', required=True, widget=ReCaptchaV2Checkbox, error_messages={'invalid': 'Check the recaptcha'})
    class Meta:
        model = User
        fields = ["username", "first_name", "last_name", "email", "password1", "password2", "captcha"]
