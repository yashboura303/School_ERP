

from django.contrib import admin
from django.urls import path
from django.conf.urls import include


urlpatterns = [
    path('admin/', admin.site.urls),
    path('',include('home.urls')),
    path('auth/',include('accounts.urls')),
    path('studentForm/',include('form.urls')),
    path('dashboard/',include('dashboard.urls')),
    path('empForm/',include('employeeform.urls')),
]
