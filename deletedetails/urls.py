from django.urls import path
from . import views

urlpatterns = [
    path('listStudents', views.show_students_list, name="listStudents"),
    path('deleteStudentData/<int:pk>/', views.delete_student, name="deleteStudentData"),
    path('deletePermStudentData/<int:pk>/', views.delete_student_permanently, name="deletePermStudentData"),
    path('deletedStudentList', views.get_deleted_students_list, name="deletedStudentList"),
    path('listEmployees', views.show_employees_list, name="listEmployees"),
    path('deleteEmployeeData/<int:pk>/', views.delete_employee, name="deleteEmployeeData"),
    path('deletePermEmployeeData/<int:pk>/', views.delete_employee_permanently, name="deletePermEmployeeData"),
    path('deletedEmployeeList', views.get_deleted_employees_list, name="deletedEmployeeList"),
]
