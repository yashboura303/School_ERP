

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
    path('marks/', include('markssection.urls')),
    path('dashboard/', include('dashboard.urls')),
    path('empForm/', include('employeeform.urls')),
    path('classForm/', include('classform.urls')),
    path('attendence/', include('attendence.urls')),
    path('homework/', include('homework.urls')),
    path('notice/', include('notice.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
