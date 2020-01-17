from django.contrib import admin
from .models import Vehicle, Routes, Driver
# Register your models here.
admin.site.register(Vehicle)
admin.site.register(Driver)
admin.site.register(Routes)