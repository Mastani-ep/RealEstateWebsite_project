from django.shortcuts import render
from .forms import RegisterForm
from django.shortcuts import redirect
# Create your views here.

def register(request):
    recaptcha_warning = False
    registered = False
    if request.method =="POST":
        form = RegisterForm(request.POST)
        if form.is_valid():
            form.save()
            recaptcha_warning = False
            registered = True
        else:
            recaptcha_warning = True
    else:
        form = RegisterForm()

    return render(request, "accounts/register.html", {"form": form, "recaptcha_warning": recaptcha_warning,
                                                      "registered": registered})

