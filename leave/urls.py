from django.urls import path
from . import views

urlpatterns = [
    path('employeeLeave/', views.employee_leave, name="employeeLeave"),
    path('studentLeave/', views.student_leave, name="studentLeave"),

]