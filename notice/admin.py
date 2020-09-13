from django.contrib import admin
from .models import StudentNotice, ClassNotice
# Register your models here.
admin.site.register(StudentNotice)
admin.site.register(ClassNotice)