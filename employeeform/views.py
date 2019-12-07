from django.shortcuts import render,redirect
from .models import Employee, Teacher, EmployeeDocuments,PermanentAddress,CurrentAddress;
from datetime import date
from django.contrib import messages
from classform.models import ClassRoom, ClassRoomStudent
# Create your views here.
def form(request):
    if request.method == "POST":
        # Student Details
        empID = request.POST.get("empID")
        DOB = request.POST["DOB"]
        joinDate = request.POST["joinDate"]
        DOB = date(*map(int, DOB.split('-')))
        joinDate = date(*map(int, joinDate.split('-')))
        fName = request.POST.get("firstname", "")
        lName = request.POST.get("lastname", "")
        gender = request.POST.get("gender", "")
        email = request.POST.get("email", "")
        empID = request.POST.get("empid", "")
        anumber = request.POST.get("anumber", "")
        phonenumber = request.POST.get("phonenumber", "")
        bloodGroup = request.POST.get("bloodGroup", "")
        fatherName = request.POST.get("fatherName", "")
        motherName = request.POST.get("motherName", "")
        experience = request.POST.get("experience", "")
        maritalStatus = request.POST.get("maritalStatus", "")
        partnerName = request.POST.get("partnerName", "")
        currentAdd1 = request.POST.get("currentinputAddress", "")
        currentAdd2 = request.POST.get("currentinputAddress2", "")
        currentCity = request.POST.get("inputCity", "")
        currentState = request.POST.get("inputState", "")
        currentZip = request.POST.get("inputZip", "")
        permAdd1 = request.POST.get("perminputAddress", "")
        permAdd2 = request.POST.get("perminputAddress2", "")
        permCity = request.POST.get("perminputCity", "")
        permState = request.POST.get("perminputState", "")
        permZip = request.POST.get("perminputZip", "")
        empCategory = request.POST.get("empCategory", "")
        if empCategory == "teacher":
                teacherFirstName = request.POST.get("teacherFirstName", "")
                teacherLastName = request.POST.get("teacherLastName", "")
                specialization = request.POST.get("specialization", "")
                designation = request.POST.get("designation", "")
                classTeacher = request.POST.get("classTeacher", "")


        employee = Employee.objects.create(empID = empID)
        employee.firstName = fName
        employee.lastName = lName
        employee.partnerName = partnerName
        employee.fullName = fName +" "+ lName
        employee.dob = DOB
        employee.joiningDate = joinDate
        employee.maritalStatus = maritalStatus
        employee.experience = experience
        employee.currentAddress = currentAdd1 +" "+ currentAdd2 +","+ currentCity +","+ currentState +"-"+ currentZip
        employee.permanentAddress = permAdd1 + " "+permAdd2 +","+ permCity +","+ permState +"-"+ permZip
        employee.gender = gender
        employee.email = email
        employee.mobileNumber = phonenumber
        employee.bloodGroup = bloodGroup
        employee.aadharNumber = anumber
        employee.fatherName = fatherName
        employee.motherName = motherName
        employee.empCategory = empCategory
        employee.save()

        permanent = PermanentAddress.objects.create(employee = employee)
        permanent.Address = permAdd1+ permAdd2
        permanent.Address1 = permAdd1
        permanent.Address2 = permAdd2
        permanent.zipCode = permZip
        permanent.state = permState
        permanent.city = permCity

        current = CurrentAddress.objects.create(employee = employee)
        current.Address1 = currentAdd1
        current.Address = currentAdd1+ currentAdd2
        current.Address2 = currentAdd2
        current.zipCode = currentZip
        current.city = currentCity
        current.state = currentState

        if empCategory == "teacher":
            teacher = Teacher.objects.create(employee = employee)
            teacher.firstName = teacherFirstName
            teacher.lastName = teacherLastName
            teacher.fullName = teacherFirstName + " "+ teacherLastName
            teacher.specialization = specialization
            teacher.designation = designation
            teacher.save()
            #alert message when class has already a class teacher
            if ClassRoom.objects.filter(classSection__exact = classTeacher):
                messages.error(request, "Class already has a teacher")
                return redirect('employeeForm')
            else:
                teacher.classTeacher = classTeacher
                teacher.save()
                classroom = ClassRoom.objects.create(classSection = classTeacher, teacher = teacher)
                classroom.save()


        documents = EmployeeDocuments.objects.create(employee = employee)
        documents.IdProof = request.FILES["idproof"]
        documents.photo = request.FILES["photgraph"]
        documents.qualificationDoc = request.FILES["qualificationDoc"]
        documents.addressProof = request.FILES["addressProof"]
        documents.otherDoc = request.FILES["otherDoc"]
        documents.save()
        messages.success(request,"Record successfully added")
        return redirect('employeeForm')

    return render(request, 'employee/recordForm.html')

def update(request):
    if request.method == "POST":
        # Student Details

        if not request.POST.get("addmissionnumber"):
            messages.info(request, 'Enter addmission Number!')
            return redirect('updateInfo.html')
        else:
            empID = request.POST.get("empID")
            employee = Employee.objects.get(empID = int(empID))
            teacher = Teacher.objects.get(employee = employee)
            current = CurrentAddress.objects.get(employee = employee)
            permanent = PermanentAddress.objects.get(employee = employee)
            DOB = request.POST["DOB"]
            joinDate = request.POST["joinDate"]
            DOB = date(*map(int, DOB.split('-')))
            joinDate = date(*map(int, joinDate.split('-')))
            fName = request.POST.get("firstname", employee.firstName)
            lName = request.POST.get("lastname", employee.lastName)
            gender = request.POST.get("gender", employee.gender)
            email = request.POST.get("email", employee.email)
            anumber = request.POST.get("anumber", employee.aadharNumber)
            phonenumber = request.POST.get("phonenumber", employee.mobileNumber)
            bloodGroup = request.POST.get("bloodGroup", employee.bloodGroup)
            fatherName = request.POST.get("fatherName", employee.fatherName)
            motherName = request.POST.get("motherName", employee.motherName)
            experience = request.POST.get("experience", employee.experience)
            maritalStatus = request.POST.get("maritalStatus", employee.maritalStatus)
            partnerName = request.POST.get("partnerName",employee.partnerName )
            currentAdd1 = request.POST.get("currentinputAddress", current.Address1)
            currentAdd2 = request.POST.get("currentinputAddress2", current.Address2)
            currentCity = request.POST.get("inputCity", current.city)
            currentState = request.POST.get("inputState", current.state)
            currentZip = request.POST.get("inputZip", current.zipCode)
            permAdd1 = request.POST.get("perminputAddress", permanent.Address1)
            permAdd2 = request.POST.get("perminputAddress2", permanent.Address2)
            permCity = request.POST.get("perminputCity", permanent.city)
            permState = request.POST.get("perminputState", permanent.state)
            permZip = request.POST.get("perminputZip", permanent.zipCode)
            empCategory = request.POST.get("empCategory", employee.empCategory)
            if empCategory == "Teacher":

                teacherFirstName = request.POST.get("teacherFirstName", teacher.firstName)
                teacherLastName = request.POST.get("teacherLastName", teacher.lastName)
                specialization = request.POST.get("specialization", teacher.specialization)
                designation = request.POST.get("designation", teacher.designation)
                classTeacher = request.POST.get("classTeacher", teacher.classTeacher)



            employee.firstName = fName
            employee.lastName = lName
            employee.partnerName = partnerName
            employee.fullName = fName +" "+ lName
            employee.dob = DOB
            employee.joiningDate = joinDate
            employee.maritalStatus = maritalStatus
            employee.experience = experience
            employee.currentAddress = currentAdd1 +" "+ currentAdd2 +","+ currentCity +","+ currentState +"-"+ currentZip
            employee.permanentAddress = permAdd1 + " "+permAdd2 +","+ permCity +","+ permState +"-"+ permZip
            employee.gender = gender
            employee.email = email
            employee.mobileNumber = phonenumber
            employee.bloodGroup = bloodGroup
            employee.aadharNumber = anumber
            employee.fatherName = fatherName
            employee.motherName = motherName
            employee.empCategory = empCategory
            employee.save()

            if empCategory == "teacher":
                teacher = Teacher.objects.create(employee = employee)
                teacher.firstName = teacherFirstName
                teacher.lastName = teacherLastName
                teacher.fullName = teacherFirstName + " "+ teacherLastName
                teacher.specialization = specialization
                teacher.designation = designation
                teacher.classTeacher = classTeacher
                teacher.save()

            messages.info(request,"Record successfully added")
            return redirect('employeeForm')
    return render(request, 'employee/updateInfo.html')

def updateWithData(request,pk):
    employee = Employee.objects.get(empID = (pk))
    pAdd = PermanentAddress.objects.get(employee = employee)
    teacher = Teacher.objects.get(employee = employee)
    cAdd = CurrentAddress.objects.get(employee = employee)
    DOB_to_String = str(employee.dob)
    joinDate_to_String = str(employee.joiningDate)
    return render(request, 'employee/updateInfo.html',{"employee":employee,"pAdd":pAdd,"cAdd":cAdd,"dob":DOB_to_String,"joiningDate":joinDate_to_String,"teacher":teacher})

def print(request,pk):
    employee = Employee.objects.get(empID = pk)
    pAdd = PermanentAddress.objects.get(employee = employee)
    cAdd = CurrentAddress.objects.get(employee = employee)
    if employee.empCategory != "teacher":
        return render(request, 'employee/printEmployeeData.html',{"employee":employee,"pAdd":pAdd,"cAdd":cAdd} )
    else:
        teacher = Teacher.objects.get(employee=employee)
        return render(request, 'employee/printTeacherData.html',{"employee":employee,"pAdd":pAdd,"cAdd":cAdd,"teacher":teacher} )

def search(request):
     
    if request.method == "GET":

        employee = Employee.objects.all()

        if "name" in request.GET:
            name = request.GET["name"]
            employee = employee.filter(fullName__icontains = name)
        if "category" in request.GET:
            category = request.GET["category"]
            employee = employee.filter(empCategory__icontains = category)
        if "empID" in request.GET:
            empID = request.GET["empID"]
            employee = employee.filter(empID__icontains = empID)
            if employee:
                # permAdd = PermanentAddress.objects.filter(admissionNumber = student)
                # currentAdd = CurrentAddress.objects.get(admissionNumber = student)
                return render(request, 'employee/emplSearchPage.html',{"employees":employee})
            else:
                messages.error(request, 'Cant find employee with entered detail')
                return redirect('empSearchPage')
    return render(request, 'employee/emplSearchPage.html')