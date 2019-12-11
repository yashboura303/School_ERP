"""
Urls for attendence app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('student', views.student_attendence, name="attendenceStudent"),
    path('piechartStudent', views.student_pie_chart, name="piechartStudent"),
    path('piechartTeacher', views.teacher_pie_chart, name="piechartTeacher"),
    path('teacher', views.teacher_attendence, name="attendenceTeacher"),
]
