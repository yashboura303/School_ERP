from django.contrib import admin
from .models import StudentAttendence, TeacherAttendence
# Register your models here.
admin.site.register(StudentAttendence)
admin.site.register(TeacherAttendence)
