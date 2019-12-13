from django.contrib import admin
from .models import ExamType, Marks, Exam, ExamMapping
# Register your models here.
admin.site.register(ExamType)
admin.site.register(Marks)
admin.site.register(Exam)
admin.site.register(ExamMapping)

                        # {% if exam_type.examType==values.exam_type %}
                        #  selected
                        #   {% endif %}