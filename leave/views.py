from django.shortcuts import render
from employeeform.models import Employee
from form.models import StudentInfo
from .models import StudentLeave, EmployeeLeave
from datetime  import date
# Create your views here.


def employee_leave(request):
    if request.method == "POST":
        emp_id = request.POST.get("emp_id")
        description = request.POST.get("description")
        subject = request.POST.get("subject")
        date_to = request.POST.get("date_to")
        date_from = request.POST.get("date_from")
        date_to = date(*map(int, date_to.split('-')))
        date_from = date(*map(int, date_from.split('-')))
        EmployeeLeave.objects.create(employee=Employee.objects.get(
            empID=emp_id), description=description, subject=subject, date_from=date_from, date_to=date_to)
    return render(request, "leave/employee.html")


def student_leave(request):
    if request.method == "POST":
        admissionNumber = request.POST.get("admissionNumber")
        description = request.POST.get("description")
        subject = request.POST.get("subject")
        date_to = request.POST.get("date_to")
        date_from = request.POST.get("date_from")
        date_to = date(*map(int, date_to.split('-')))
        date_from = date(*map(int, date_from.split('-')))
        StudentLeave.objects.create(student=StudentInfo.objects.get(
            admissionNumber=admissionNumber), description=description, subject=subject, date_from=date_from, date_to=date_to)
    return render(request, "leave/student.html")
