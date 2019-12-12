from django.contrib import admin
from .models import ExamType, Marks, SubjectsToClass
# Register your models here.
admin.site.register(ExamType)
admin.site.register(Marks)
admin.site.register(SubjectsToClass)