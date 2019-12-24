"""
student form urls
"""
from django.urls import path
from . import views

urlpatterns = [
    path('', views.form, name="recordForm"),
    path('update', views.update, name="updateInfo"),
    path('search', views.search, name="searchPage"),
    path('uploadExcel', views.upload_excel_data, name="uploadExcelData"),
    path('update/<int:admission_number>/', views.update_with_data, name="updateInfoWithData"),
    path('print/<int:admission_number>/', views.printinfo, name="printStudentData"),
]
