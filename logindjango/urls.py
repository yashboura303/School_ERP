

from django.contrib import admin
from django.urls import path
from django.conf.urls import include
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('home.urls')),
    path('auth/', include('accounts.urls')),
    path('studentForm/', include('form.urls')),
    path('marks/', include('marks.urls')),
    path('dashboard/', include('dashboard.urls')),
    path('empForm/', include('employeeform.urls')),
    path('classForm/', include('classform.urls')),
    path('attendence/', include('attendence.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
