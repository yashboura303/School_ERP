"""
Admin panel for employee form
"""
from django.contrib import admin
from .models import PermanentAddress, CurrentAddress, Employee, Teacher, EmployeeDocuments
# Register your models here.
admin.site.register(Teacher)
admin.site.register(Employee)
admin.site.register(EmployeeDocuments)
admin.site.register(PermanentAddress)
admin.site.register(CurrentAddress)
