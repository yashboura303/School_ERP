

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
    path('thought/', include('dailythought.urls')),
    path('newsletter/', include('newsletter.urls')),
    path('schoolinfo/', include('schoolinfo.urls')),
    path('holiday/', include('holiday.urls')),
    path('fees/', include('fees.urls')),
    path('feeReport/', include('feereport.urls')),
    path('transport/', include('transport.urls')),
    path('visitor/', include('visitors.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
