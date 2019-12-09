"""
Urls for attendence app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('student', views.student_attendence, name="attendenceStudent"),
    path('teacher', views.teacher_attendence, name="attendenceTeacher"),
    # path('update', views., name="updateEmpInfo"),
    # path('search', views.search, name="empSearchPage"),
    # path('update/<int:pk>/', views.update_with_data, name="updateEmpData"),
    # path('print/<int:pk>/', views.print, name="printEmpData"),
]
