"""
Admin panel for classroom app
"""
from django.contrib import admin
from .models import ClassRoom, ClassRoomStudent, StudentRouteAttendence
# Register your models here.
admin.site.register(ClassRoom)
admin.site.register(ClassRoomStudent)
admin.site.register(StudentRouteAttendence)
