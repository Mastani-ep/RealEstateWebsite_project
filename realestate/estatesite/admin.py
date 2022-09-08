from django.contrib import admin
from .models import Property, Agent
from django.contrib.auth.models import User
from django.contrib import admin
# Register your models here.

admin.site.register(Agent)
admin.site.register(Property)