"""
Urls for homework app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.homework_home, name="homeworkHome"),
    path('checkHomework', views.check_homework, name="checkHomework"),
]
