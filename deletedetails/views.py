from django.shortcuts import render, redirect, HttpResponse
from form.models import StudentInfo, CurrentAddress, PermanentAddress, ParentInfo
from django.contrib import messages
from .models import DeletedCurrentAddress, DeletedParentInfo, DeletedStudentInfo, DeletedPermanentAddress, DeletedEmployee, DeletedEmployeePermanentAddress,DeletedEmployeeCurrentAddress, DeletedTeacher
from classform.models import ClassRoom
from accounts.models import UserProfile
from employeeform.models import Employee, Teacher, CurrentAddress as empCurrentAddress, PermanentAddress as empPermanentAddress
# Create your views here.
def show_students_list(request):
    """
    Show student list with partial delete and permanent delete option
    """
    if request.method == "GET":
        students = StudentInfo.objects.all()
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
    """
    Partially delete the stduent delete i.e. delete data from StudentInfo and save it to deletedStudentInfo
    """
    student = StudentInfo.objects.get(admissionNumber=pk)
    deleted_student = DeletedStudentInfo.objects.create(firstName=student.firstName, lastName=student.firstName, fullName=student.fullName,gender=student.gender,dob=student.dob,classSection=student.classSection,admissionNumber=student.admissionNumber,mobileNumber=student.mobileNumber,religion=student.religion, caste=student.caste,tcNumber=student.tcNumber,aadharNumber=student.aadharNumber,feeWaiverCategory=student.feeWaiverCategory,prevSchoolName=student.prevSchoolName)


    current_address = CurrentAddress.objects.get(student=student)
    DeletedCurrentAddress.objects.create(student=deleted_student, Address=current_address.Address, Address1=current_address.Address1, Address2=current_address.Address2,zipCode=current_address.zipCode,state=current_address.state,city=current_address.city)


    permanent_address = PermanentAddress.objects.get(student=student)
    DeletedPermanentAddress.objects.create(student=deleted_student, Address=permanent_address.Address, Address1=permanent_address.Address1, Address2=permanent_address.Address2,zipCode=permanent_address.zipCode,state=permanent_address.state,city=permanent_address.city)

    parent_info = ParentInfo.objects.get(student=student)
    DeletedParentInfo.objects.create(student=deleted_student, fatherName=parent_info.fatherName,motherName=parent_info.motherName,Fatherdob=parent_info.Fatherdob,Motherdob=parent_info.Motherdob, MobileNumber=parent_info.MobileNumber, altMobileNumber=parent_info.altMobileNumber,gaurdianQual=parent_info.gaurdianQual,guardianOccup=parent_info.guardianOccup,email=parent_info.email,motherQual=parent_info.motherQual,motherOccup=parent_info.motherOccup)

    student.delete()
    current_address.delete()
    permanent_address.delete()
    parent_info.delete()

    user_profile = UserProfile.objects.get(addmission_number=pk)
    user_profile.user.delete()
    user_profile.delete()
    messages.success(request, "Deleted record")
    return render(request, 'deletedetails/studentsDelete.html', {"class_rooms":ClassRoom.objects.all()})

def delete_student_permanently(request, pk):
    """
    Permanently delete the student info from database
    """
    student = StudentInfo.objects.get(admissionNumber=pk)
    current_address = CurrentAddress.objects.get(student=student)
    permanent_address = PermanentAddress.objects.get(student=student)
    parent_info = ParentInfo.objects.get(student=student)
    student.delete()
    current_address.delete()
    permanent_address.delete()
    parent_info.delete()

    try:
        user_profile = UserProfile.objects.get(addmission_number=pk)
        user_profile.user.delete()
        user_profile.delete()
    except:
        pass
    
    messages.success(request, "Permanently Deleted record")
    return render(request, 'deletedetails/studentsDelete.html', {"class_rooms":ClassRoom.objects.all()})

def get_deleted_students_list(request):
    """
    Get the list of partially deleted students
    """
    students = DeletedStudentInfo.objects.all()
    return render(request, 'deletedetails/deletedDetailList.html',{"students":students})

def show_employees_list(request):
    """
    Show employees list with partial delete and permanent delete option
    """
    if request.method == "GET":
        employee = Employee.objects.all()
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
    """
    Partially delete the demployee info i.e Delete data from Employee and save it to deletedEmployee
    """
    employee = Employee.objects.get(empID=pk)
    deleted_employee = DeletedEmployee.objects.create(empID=employee.empID, firstName=employee.firstName, lastName=employee.lastName, fullName=employee.fullName, father_name=employee.father_name, mother_name=employee.mother_name, partnerName=employee.partnerName, gender=employee.gender, email=employee.email, dob=employee.dob, joiningDate=employee.joiningDate, bloodGroup=employee.bloodGroup, mobile_number=employee.mobile_number, marital_status=employee.marital_status, experience=employee.experience, aadharNumber=employee.aadharNumber, empCategory=employee.empCategory )

    if employee.empCategory=="teacher":
        teacher = Teacher.objects.get(employee=employee)
        DeletedTeacher.objects.create(employee=delete_employee, specialization=teacher.specialization,designation=teacher.designation,classTeacher=teacher.classTeacher)

    current_address = empCurrentAddress.objects.get(employee=employee)
    DeletedCurrentAddress.objects.create(employee=deleted_employee, Address=current_address.Address, Address1=current_address.Address1, Address2=current_address.Address2,zipCode=current_address.zipCode,state=current_address.state,city=current_address.city)


    permanent_address = empPermanentAddress.objects.get(employee=employee)
    DeletedPermanentAddress.objects.create(employee=deleted_employee, Address=permanent_address.Address, Address1=permanent_address.Address1, Address2=permanent_address.Address2,zipCode=permanent_address.zipCode,state=permanent_address.state,city=permanent_address.city)

    user_profile = UserProfile.objects.get(emp_id=pk)
    user_profile.user.delete()
    user_profile.delete()

    messages.success(request, "Deleted record")
    return render(request, 'deletedetails/employeesDelete.html')

def delete_employee_permanently(request, pk):
    employee = Employee.objects.get(empID=pk)
    current_address = empCurrentAddress.objects.get(employee=employee)
    permanent_address = empPermanentAddress.objects.get(employee=employee)
    if employee.category == "teacher":
        teacher = Teacher.objects.get(employee=employee)
        teacher.delete()
    employee.delete()
    current_address.delete()
    permanent_address.delete()

    
    user_profile = UserProfile.objects.get(emp_id=pk)
    user_profile.user.delete()
    user_profile.delete()
    messages.success(request, "Permanently Deleted record")
    return render(request, 'deletedetails/employeesDelete.html')


def get_deleted_employees_list(request):
    """
    Get the list of deleted employees
    """
    employees = DeletedEmployee.objects.all()
    return render(request, 'deletedetails/deletedEmployeesList.html',{"employees":employees})