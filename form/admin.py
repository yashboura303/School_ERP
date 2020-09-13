"""
Admin panel for student form
"""
from django.contrib import admin
from .models import StudentInfo, Documents, ParentInfo, PermanentAddress, CurrentAddress, StudentRoute
# Register your models here.
admin.site.register(StudentInfo)
admin.site.register(Documents)
admin.site.register(ParentInfo)
admin.site.register(PermanentAddress)
admin.site.register(CurrentAddress)
admin.site.register(StudentRoute)
