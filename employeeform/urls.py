from django.urls import path
from . import views

urlpatterns = [
    path('',views.form, name="employeeForm"),
    path('update',views.update, name = "updateEmpInfo"),
    path('search',views.search, name = "empSearchPage"),
    path('update/<int:pk>/',views.updateWithData, name ="updateEmpData"),
    path('print/<int:pk>/',views.print, name ="printEmpData"),
]