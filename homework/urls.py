"""
Urls for homework app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.homework_home, name="homeworkHome"),
    path('syllabus', views.syllabus, name="syllabus"),
    path('checkHomework', views.check_homework, name="checkHomework"),
]
