"""
Urls for notice app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.notice_home, name="noticeHome"),
    path('student', views.search_student, name="searchStudent"),
    path('student/<int:pk>/', views.notice__student, name="noticeStudent"),
    path('dowloadClassNotice/<int:pk>/', views.download_class_notice, name="dowloadClassNotice"),
    path('checkStudentNotice/', views.check_notice_student, name="checkStudentNotice"),
    path('checkClassNotice/', views.check_class_notice, name="checkClassNotice"),

]
