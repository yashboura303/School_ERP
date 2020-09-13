"""
employee form urls
"""
from django.urls import path
from . import views

urlpatterns = [
    path('', views.form, name="employeeForm"),
    path('update', views.update, name="updateEmpInfo"),
    path('search', views.search, name="empSearchPage"),
    path('empCredentials', views.get_teachers_credentials, name="empCredentials"),
    path('update/<int:emp_id>/', views.update_with_data, name="updateEmpData"),
    path('print/<int:emp_id>/', views.print, name="printEmpData"),
]
