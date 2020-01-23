from django.urls import path
from . import views

urlpatterns = [
    path('employeeLeave/', views.employee_leave, name="employeeLeave"),
    path('studentLeave/', views.student_leave, name="studentLeave"),
    path('viewStudentLeaves/', views.view_student_leaves, name="viewStudentLeaves"),
    path('approveLeave/<int:id>/', views.approve_leave, name="approveLeave"),
    path('rejectLeave/<int:id>/', views.reject_leave, name="rejectLeave"),

]