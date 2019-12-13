"""
Urls for marks app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="marksHome"),
    path('addExam', views.add_exam_form, name="addExamForm"),
    path('addExamType', views.exam_type_form, name="addExamType"),
    path('examMapping', views.exam_mapping, name="examMapping"),
    path('addMarks', views.add_marks, name="addMarks"),
]
