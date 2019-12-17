from django.contrib import admin
from .models import ExamType, Marks, Exam, ExamMapping, AdditionalSubjectMapping
# Register your models here.
admin.site.register(ExamType)
admin.site.register(Exam)
admin.site.register(ExamMapping)
admin.site.register(AdditionalSubjectMapping)

class MarksAdmin(admin.ModelAdmin):
    list_filter =('examName','subject')
    # list_display = ('marks',)

admin.site.register(Marks, MarksAdmin)