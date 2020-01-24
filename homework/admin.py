from django.contrib import admin
from .models import HomeWork, Syllabus
# Register your models here.

class HomeWorkAdmin(admin.ModelAdmin):
    list_filter =('classRoom','subject')
    # list_display = ('marks',)

admin.site.register(HomeWork, HomeWorkAdmin)
admin.site.register(Syllabus)