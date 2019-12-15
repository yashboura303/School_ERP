from django.contrib import admin
from .models import ExamType, Marks, Exam, ExamMapping, AdditionalSubjectMapping
# Register your models here.
admin.site.register(ExamType)
admin.site.register(Marks)
admin.site.register(Exam)
admin.site.register(ExamMapping)
admin.site.register(AdditionalSubjectMapping)

                        # {% if exam_type.examType==values.exam_type %}
                        #  selected
                        #   {% endif %}