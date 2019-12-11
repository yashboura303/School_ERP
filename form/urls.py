"""
student form urls
"""
from django.urls import path
from . import views

urlpatterns = [
    path('', views.form, name="recordForm"),
    path('update', views.update, name="updateInfo"),
    path('search', views.search, name="searchPage"),
    path('update/<int:pk>/', views.update_with_data, name="updateInfoWithData"),
    path('print/<int:pk>/', views.printinfo, name="printStudentData"),
]
