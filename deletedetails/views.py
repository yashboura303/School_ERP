from django.shortcuts import render, redirect, HttpResponse
from form.models import StudentInfo
from django.contrib import messages
from classform.models import ClassRoom
from accounts.models import UserProfile
from employeeform.models import Employee
# Create your views here.
def show_students_list(request):
    if request.method == "GET":
        students = StudentInfo.objects.filter(deleted=False)
        if "name" in request.GET:
            name = request.GET["name"]
            students = students.filter(fullName__icontains=name)
        if "classSection" in request.GET:
            class_section = request.GET["classSection"]
            students = students.filter(classSection__icontains=class_section)
        if "addNumber" in request.GET:
            add_no = request.GET["addNumber"]
            students = students.filter(admissionNumber__icontains=(add_no))
            if students:
                return render(request, 'deletedetails/studentsDelete.html', {"students": students,"values":request.GET, "class_rooms":ClassRoom.objects.all()})
            else:
                messages.error(
                    request, 'Cant find student with entered detail')
                return redirect('listStudents')
    return render(request, 'deletedetails/studentsDelete.html', {"class_rooms":ClassRoom.objects.all()})

def delete_student(request, pk):
    student = StudentInfo.objects.get(admissionNumber=pk)
    student.deleted = True
    student.save()
    user_profile = UserProfile.objects.get(addmission_number=pk)
    user_profile.user.delete()
    user_profile.delete()
    messages.success(request, "Deleted record")
    return render(request, 'deletedetails/studentsDelete.html', {"class_rooms":ClassRoom.objects.all()})

def get_deleted_students_list(request):
    students = StudentInfo.objects.filter(deleted=True)
    return render(request, 'deletedetails/deletedDetailList.html',{"students":students})

def show_employees_list(request):
    if request.method == "GET":
        employee = Employee.objects.filter(deleted=False)
        if "name" in request.GET:
            name = request.GET["name"]
            employee = employee.filter(fullName__icontains=name)
        if "empID" in request.GET:
            emp_id = request.GET["empID"]
            employee = employee.filter(empID__icontains=emp_id)
            if employee:
                return render(request, 'deletedetails/employeesDelete.html', {"employees": employee, "values":request.GET})
            messages.error(
                request, 'Cant find employee with entered detail')
            return redirect('listEmployees')
    return render(request, 'deletedetails/employeesDelete.html')

def delete_employee(request, pk):
    employee = Employee.objects.get(empID=pk)
    employee.deleted = True
    employee.save()
    user_profile = UserProfile.objects.get(emp_id=pk)
    user_profile.user.delete()
    user_profile.delete()
    messages.success(request, "Deleted record")
    return render(request, 'deletedetails/employeesDelete.html')


def get_deleted_employees_list(request):
    employees = Employee.objects.filter(deleted=True)
    return render(request, 'deletedetails/deletedEmployeesList.html',{"employees":employees})