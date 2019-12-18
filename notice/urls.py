"""
Urls for notice app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.notice_home, name="noticeHome"),
    path('student', views.search_student, name="searchStudent"),
    path('student/<int:pk>/', views.notice__student, name="noticeStudent"),

]
