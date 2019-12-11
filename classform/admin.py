"""
Admin panel for classroom app
"""
from django.contrib import admin
from .models import ClassRoom, ClassRoomStudent
# Register your models here.
admin.site.register(ClassRoom)
admin.site.register(ClassRoomStudent)
