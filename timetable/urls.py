"""
Urls for timetable app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.add_detail, name="addTimeTableDetail"),

]
