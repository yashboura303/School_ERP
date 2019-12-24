"""
  Handle employee registration part
"""
from datetime import date
from django.shortcuts import render, redirect
from django.contrib import messages
from classform.models import ClassRoom
from .models import Employee, Teacher, EmployeeDocuments, PermanentAddress, CurrentAddress


# Create your views here.
def form(request):
    """
    add new employee info to employee and teacher table and set media path of documents
    input: form values

    """
    if request.method == "POST":
        # Student Details
        emp_id = request.POST.get("empID")
        dob = request.POST["DOB"]
        join_date = request.POST["joinDate"]
        dob = date(*map(int, dob.split('-')))
        join_date = date(*map(int, join_date.split('-')))
        f_name = request.POST.get("firstname", "")
        l_name = request.POST.get("lastname", "")
        gender = request.POST.get("gender", "")
        email = request.POST.get("email", "")
        a_number = request.POST.get("a_number", "")
        phone_number = request.POST.get("phone_number", "")
        blood_group = request.POST.get("blood_group", "")
        father_name = request.POST.get("father_name", "")
        mother_name = request.POST.get("mother_name", "")
        experience = request.POST.get("experience", "")
        marital_status = request.POST.get("marital_status", "")
        partner_name = request.POST.get("partnerName", "")
        current_add1 = request.POST.get("currentinputAddress", "")
        current_add2 = request.POST.get("currentinputAddress2", "")
        current_city = request.POST.get("inputCity", "")
        current_state = request.POST.get("inputState", "")
        current_zip = request.POST.get("inputZip", "")
        perm_add1 = request.POST.get("perminputAddress", "")
        perm_add2 = request.POST.get("perminputAddress2", "")
        perm_city = request.POST.get("perminputCity", "")
        perm_state = request.POST.get("perminputState", "")
        perm_zip = request.POST.get("perminputZip", "")
        emp_category = request.POST.get("empCategory", "")
        if emp_category == "teacher":
            teacher_first_name = request.POST.get("teacherFirstName", "")
            teacher_last_name = request.POST.get("teacherLastName", "")
            specialization = request.POST.get("specialization", "")
            designation = request.POST.get("designation", "")
            classTeacher = request.POST.get("classTeacher", "")

        employee = Employee.objects.create(empID=emp_id)
        employee.firstName = f_name
        employee.lastName = l_name
        employee.partnerName = partner_name
        employee.fullName = f_name + " " + l_name
        employee.dob = dob
        employee.joiningDate = join_date
        employee.marital_status = marital_status
        employee.experience = experience
        employee.currentAddress = current_add1 + " " + current_add2 + "," + \
            current_city + "," + current_state + \
            "-" + current_zip
        employee.permanentAddress = perm_add1 + " " + perm_add2 + "," + \
            perm_city + "," + perm_state + "-" + \
            perm_zip
        employee.gender = gender
        employee.email = email
        employee.mobile_number = phone_number
        employee.blood_group = blood_group
        employee.aadharNumber = a_number
        employee.father_name = father_name
        employee.mother_name = mother_name
        employee.empCategory = emp_category
        employee.save()

        permanent = PermanentAddress.objects.create(employee=employee)
        permanent.Address = perm_add1 + perm_add2
        permanent.Address1 = perm_add1
        permanent.Address2 = perm_add2
        permanent.zipCode = perm_zip
        permanent.state = perm_state
        permanent.city = perm_city

        current = CurrentAddress.objects.create(employee=employee)
        current.Address1 = current_add1
        current.Address = current_add1 + current_add2
        current.Address2 = current_add2
        current.zipCode = current_zip
        current.city = current_city
        current.state = current_state

        if emp_category == "teacher":
            teacher = Teacher.objects.create(employee=employee)
            teacher.firstName = teacher_first_name
            teacher.lastName = teacher_last_name
            teacher.fullName = teacher_first_name + " " + teacher_last_name
            teacher.specialization = specialization
            teacher.designation = designation
            teacher.save()
            # alert message when class has already a class teacher
            try:
                ClassRoom.objects.filter(classSection__exact=classTeacher)
                messages.error(request, "Class already has a teacher")
                return redirect('employeeForm')
            except:
                teacher.classTeacher = classTeacher
                teacher.save()
                classroom = ClassRoom.objects.create(
                    classSection=classTeacher, teacher=teacher)
                classroom.save()

        documents = EmployeeDocuments.objects.create(employee=employee)
        documents.IdProof = request.FILES["idproof"]
        documents.photo = request.FILES["photgraph"]
        documents.qualificationDoc = request.FILES["qualificationDoc"]
        documents.addressProof = request.FILES["addressProof"]
        documents.otherDoc = request.FILES["otherDoc"]
        documents.save()
        messages.success(request, "Record successfully added")
        return redirect('employeeForm')

    return render(request, 'employee/recordForm.html')


def update(request):  
    """
    update employee info in employee and teacher table
    input: form values
    """
    if request.method == "POST":
        # Student Details
        if not request.POST.get("addmissionnumber"):
            messages.info(request, 'Enter addmission Number!')
            return redirect('updateInfo.html')
        emp_id = request.POST.get("empID")
        employee = Employee.objects.get(empID=int(emp_id))
        teacher = Teacher.objects.get(employee=employee)
        current = CurrentAddress.objects.get(employee=employee)
        permanent = PermanentAddress.objects.get(employee=employee)
        dob = request.POST["DOB"]
        join_date = request.POST["joinDate"]
        dob = date(*map(int, dob.split('-')))
        join_date = date(*map(int, join_date.split('-')))
        f_Name = request.POST.get("firstname", employee.firstName)
        l_Name = request.POST.get("lastname", employee.lastName)
        gender = request.POST.get("gender", employee.gender)
        email = request.POST.get("email", employee.email)
        a_number = request.POST.get("a_number", employee.aadharNumber)
        phone_number = request.POST.get(
            "phone_number", employee.mobileNumber)
        blood_group = request.POST.get("blood_group", employee.blood_group)
        father_name = request.POST.get("father_name", employee.father_name)
        mother_name = request.POST.get("mother_name", employee.mother_name)
        experience = request.POST.get("experience", employee.experience)
        marital_status = request.POST.get(
            "marital_status", employee.marital_status)
        partner_name = request.POST.get("partnerName", employee.partnerName)
        currentAdd1 = request.POST.get(
            "currentinputAddress", current.Address1)
        currentAdd2 = request.POST.get(
            "currentinputAddress2", current.Address2)
        currentCity = request.POST.get("inputCity", current.city)
        currentState = request.POST.get("inputState", current.state)
        currentZip = request.POST.get("inputZip", current.zipCode)
        permAdd1 = request.POST.get("perminputAddress", permanent.Address1)
        permAdd2 = request.POST.get(
            "perminputAddress2", permanent.Address2)
        permCity = request.POST.get("perminputCity", permanent.city)
        permState = request.POST.get("perminputState", permanent.state)
        permZip = request.POST.get("perminputZip", permanent.zipCode)
        emp_category = request.POST.get("empCategory", employee.empCategory)
        if emp_category == "Teacher":
            teacher_first_name = request.POST.get(
                "teacherFirstName", teacher.firstName)
            teacher_last_name = request.POST.get(
                "teacherLastName", teacher.lastName)
            specialization = request.POST.get(
                "specialization", teacher.specialization)
            designation = request.POST.get(
                "designation", teacher.designation)
            classTeacher = request.POST.get(
                "classTeacher", teacher.classTeacher)

        employee.firstName = f_Name
        employee.lastName = l_Name
        employee.partnerName = partner_name
        employee.fullName = f_Name + " " + l_Name
        employee.dob = dob
        employee.joiningDate = join_date
        employee.marital_status = marital_status
        employee.experience = experience
        employee.currentAddress = currentAdd1 + " " + currentAdd2 + \
            "," + currentCity + "," + currentState + "-" + currentZip
        employee.permanentAddress = permAdd1 + " " + permAdd2 + \
            "," + permCity + "," + permState + "-" + permZip
        employee.gender = gender
        employee.email = email
        employee.mobileNumber = phone_number
        employee.blood_group = blood_group
        employee.aadharNumber = a_number
        employee.father_name = father_name
        employee.mother_name = mother_name
        employee.empCategory = emp_category
        employee.save()

        if emp_category == "teacher":
            teacher = Teacher.objects.create(employee=employee)
            teacher.firstName = teacher_first_name
            teacher.lastName = teacher_last_name
            teacher.fullName = teacher_first_name + " " + teacher_last_name
            teacher.specialization = specialization
            teacher.designation = designation
            teacher.classTeacher = classTeacher
            teacher.save()

        messages.info(request, "Record successfully added")
        return redirect('employeeForm')
    return render(request, 'employee/updateInfo.html')


def update_with_data(request, emp_id):
    """
    update form with actual data already filled in for required employee
    input: empID of employee and form values
    """
    employee = Employee.objects.get(empID=emp_id)
    p_add = PermanentAddress.objects.get(employee=employee)
    teacher = Teacher.objects.get(employee=employee)
    c_add = CurrentAddress.objects.get(employee=employee)
    dob_to_string = str(employee.dob)
    join_date_to_string = str(employee.joiningDate)
    return render(request, 'employee/updateInfo.html',
                  {"employee": employee, "pAdd": p_add, "cAdd": c_add, "dob": dob_to_string,
                   "joiningDate": join_date_to_string, "teacher": teacher})


def print(request, emp_id):
    """
    print info for employee
    input: empID number of whose data needs to be printed
    output: prints pdf with employee details
    """
    employee = Employee.objects.get(empID=emp_id)
    p_add = PermanentAddress.objects.get(employee=employee)
    c_add = CurrentAddress.objects.get(employee=employee)
    if employee.empCategory != "teacher":
        return render(request, 'employee/printEmployeeData.html', {"employee": employee, "pAdd": p_add, "cAdd": c_add})
    teacher = Teacher.objects.get(employee=employee)
    return render(request, 'employee/printTeacherData.html',
                  {"employee": employee, "pAdd": p_add, "cAdd": c_add, "teacher": teacher})


def search(request):
    """
    search employees
    input: employee category, employee id and name
    output: list of employee matching search query"""
    if request.method == "GET":

        employee = Employee.objects.all()

        if "name" in request.GET:
            name = request.GET["name"]
            employee = employee.filter(fullName__icontains=name)
        if "category" in request.GET:
            category = request.GET["category"]
            employee = employee.filter(empCategory__icontains=category)
        if "empID" in request.GET:
            emp_id = request.GET["empID"]
            employee = employee.filter(empID__icontains=emp_id)
            if employee:
                return render(request, 'employee/emplSearchPage.html', {"employees": employee, "values":request.GET})
            messages.error(
                request, 'Cant find employee with entered detail')
            return redirect('empSearchPage')
    return render(request, 'employee/emplSearchPage.html')
