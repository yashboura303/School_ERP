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
    path('additional', views.additional_sub_mapping, name="additionalMapping"),
    path('report', views.report_analysis, name="reportStudent"),
    path('reportClass', views.class_report_analysis, name="reportClass"),
    path('reportCard', views.report_card, name="reportCard"),
    path('studentMarksFilter', views.student_marks_filter, name="studentMarksFilter"),
]
