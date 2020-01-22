from django.contrib import admin
from .models import StudentLeave, EmployeeLeave
# Register your models here.
admin.site.register(StudentLeave)
admin.site.register(EmployeeLeave)