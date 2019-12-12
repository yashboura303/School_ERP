"""
Urls for marks app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="marksHome"),
    path('addExamForm', views.add_exam_form, name="addExamForm"),
    path('addSubjectForm', views.add_subject_form, name="addSubjectForm"),
    path('addMarks', views.add_marks, name="addMarks"),
]
