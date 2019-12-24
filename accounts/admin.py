from django.contrib import admin
from accounts.models import UserProfile
from django.contrib.auth.models import User
# Register your models here.
admin.site.register(UserProfile)
# admin.site.register(User)