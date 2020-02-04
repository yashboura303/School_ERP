"""
  Handle student registration part
"""
from datetime import date
from django.contrib import messages
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from classform.models import ClassRoom, ClassRoomStudent
from transport.models import Routes
from employeeform.models import Employee, Teacher
from accounts.models import UserProfile
from .models import StudentInfo, PermanentAddress, CurrentAddress, ParentInfo, Documents, StudentRoute
from openpyxl import load_workbook


# Create your views here.
def form(request):
    """
    add student info to student and media path for documents
    input: form values
    """
    if request.method == "POST":
        # Student Details
        s_dob = request.POST["sDOB"]
        if s_dob:
            s_dob = date(*map(int, s_dob.split('-')))
        attributes = request.POST.get("attributes", "")
        f_name = request.POST.get("firstname", "")
        l_name = request.POST.get("lastname", "")
        gender = request.POST.get("gender", "")
        class_section = request.POST.get("classsection", "")
        add_number = request.POST.get("addmissionnumber", "")
        phone_number = request.POST.get("phone_number", "")
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
        religion = request.POST.get("religion", "")
        caste = request.POST.get("caste", "")
        tc_number = request.POST.get("tcnumber", "")
        anumber = request.POST.get("anumber", "")
        feeCategory = request.POST.get("feeCategory", "")
        siblingid = request.POST.get("siblingid", "")
        siblingid0 = request.POST.get("siblingid0", "")
        siblingid1 = request.POST.get("siblingid1", "")
        siblingid2 = request.POST.get("siblingid2", "")
        prevschool_name = request.POST.get("prevschool_name", "")
        route_code = request.POST.get("route_code", "")
        stoppage_name = request.POST.get("stoppage_name", "")
        shift = request.POST.get("shift", "")

        # try:
        student_info = StudentInfo.objects.create(admissionNumber=add_number)
        # except:
        #     messages.error(request, "Admission Number already assigned")
        #     return render(request, 'form/recordForm.html',{"routes":Routes.objects.all()})
        if class_section:
        # class Section check
            try:
                class_room = ClassRoom.objects.get(classSection=class_section)
                student_info.classSection = class_section
                student_info.save()
                ClassRoomStudent.objects.create(classRoom=class_room, student=student_info)
            except:
                messages.error(request, "Class Doesn't Exist")
                return redirect('recordForm')
        student_info.firstName = f_name
        student_info.lastName = l_name
        student_info.fullName = f_name + " "+l_name
        student_info.attributes = attributes
        if s_dob:
            student_info.dob = s_dob
        student_info.gender = gender
        if phone_number:
            student_info.mobileNumber = phone_number
        student_info.religion = religion
        student_info.caste = caste
        if tc_number:
            student_info.tcNumber = tc_number
        if anumber:
            student_info.aadharNumber = anumber
        student_info.feeWaiverCategory = feeCategory
        if siblingid:
            student_info.siblingID = siblingid
        if siblingid0:
            student_info.siblingID0 = siblingid0
        if siblingid1:
            student_info.siblingID1 = siblingid1
        if siblingid2:
            student_info.siblingID2 = siblingid2
        student_info.prevSchoolName = prevschool_name
        student_info.save()

        #create id and password for student 
        user = User.objects.create_user(username=add_number, password=phone_number)
        user_profile = UserProfile.objects.create(
                user=user, fullName=f_name + " " + l_name, addmission_number=add_number)
        user_profile.user_type = "Student"
        user_profile.password = phone_number
        user_profile.save()


        permanent = PermanentAddress.objects.create(student=student_info)
        permanent.Address = perm_add1 + perm_add2
        permanent.Address1 = perm_add1
        permanent.Address2 = perm_add2
        permanent.zipCode = perm_zip
        permanent.state = perm_state
        permanent.city = perm_city

        current = CurrentAddress.objects.create(student=student_info)
        current.Address1 = current_add1
        current.Address = current_add1 + current_add2
        current.Address2 = current_add2
        current.zipCode = current_zip
        current.city = current_city
        current.state = current_state

        # Parent Details
        father_name = request.POST.get("fathername")
        mother_name = request.POST.get("mothername")
        m_dob = request.POST.get("mDOB")
        f_dob = request.POST.get("fDOB")
        pphone_number = request.POST.get("pphone_number")
        alt_pphone_number = request.POST.get("alt_pphone_number")
        g_qual = request.POST.get("g_qual")
        pemail = request.POST.get("pemail")
        m_qual = request.POST.get("m_qual")
        m_occup = request.POST.get("m_occup")
        g_occup = request.POST.get("g_occup")
        if m_dob:
            mDOB = date(*map(int, mDOB.split('-')))
        if f_dob:
            fDOB = date(*map(int, fDOB.split('-')))

        parent_info = ParentInfo.objects.create(student=student_info)
        parent_info.fatherName = father_name
        parent_info.motherName = mother_name
        if f_dob:
            parent_info.Fatherdob = f_dob
        if m_dob:
            parent_info.Motherdob = m_dob
        if pphone_number:
            parent_info.MobileNumber = pphone_number
        if alt_pphone_number:
            parent_info.altMobileNumber = alt_pphone_number
        parent_info.gaurdianQual = g_qual
        parent_info.guardianOccup = g_occup
        parent_info.email = pemail
        parent_info.motherQual = m_qual
        parent_info.motherQual = m_occup
        parent_info.save()


        #Route details
        
        if route_code:
            route = StudentRoute.objects.create(student=student_info)
            route.route_stoppage = stoppage_name
            route.shift = shift
            route.route_code = route_code
            route.save()

        documents = Documents.objects.create(student=student_info)
        documents.idProof = request.FILES.get("idproof")
        documents.photo = request.FILES.get("photgraph")
        documents.castCertificate = request.FILES.get("castcert")
        documents.domicile = request.FILES.get("domicile")
        documents.tc = request.FILES.get("tc")
        documents.characterCertificate = request.FILES.get("charcert")
        documents.save()
        messages.success(request, "Record successfully added")

    return render(request, 'form/recordForm.html',{"routes":Routes.objects.all()})


def update(request):
    """
    update student info in student table
    input: form values
    """
    if request.method == "POST":
        # Student Details
        add_number = request.POST.get("addmissionnumber")
        student_info = StudentInfo.objects.get(
            admissionNumber=int(add_number))
        permanent, created = PermanentAddress.objects.get_or_create(
            student=student_info)
        current, created = CurrentAddress.objects.get_or_create(student=student_info)
        sDOB = request.POST.get("sDOB")
        sDOB = date(*map(int, sDOB.split('-')))
        f_name = request.POST.get("firstname", student_info.firstName)
        l_name = request.POST.get("lastname", student_info.lastName)
        gender = request.POST.get("gender", student_info.gender)
        sDOB = request.POST.get("sDOB", student_info.dob)
        classSection = request.POST.get(
            "classection", student_info.classSection)
        phone_number = request.POST.get(
            "phone_number", student_info.mobileNumber)
        current_add1 = request.POST.get(
            "currentinputAddress", current.Address1)
        current_add2 = request.POST.get(
            "currentinputAddress2", current.Address2)
        current_city = request.POST.get("inputCity", current.city)
        current_state = request.POST.get("inputState", current.state)
        current_zip = request.POST.get("inputZip", current.zipCode)
        perm_add1 = request.POST.get(
            "perminputAddress", permanent.Address1)
        perm_add2 = request.POST.get(
            "perminputAddress2", permanent.Address2)
        perm_city = request.POST.get("perminputCity", permanent.city)
        perm_state = request.POST.get("perminputState", permanent.state)
        perm_zip = request.POST.get("perminputZip", permanent.zipCode)
        religion = request.POST.get("religion", student_info.religion)
        caste = request.POST.get("caste", student_info.caste)
        tc_number = request.POST.get("tcnumber", student_info.tcNumber)
        a_number = request.POST.get("anumber", student_info.aadharNumber)
        fee_category = request.POST.get(
            "feeCategory", student_info.feeWaiverCategory)
        sibling_id = request.POST.get("siblingid", student_info.siblingID)
        prevschool_name = request.POST.get(
            "prevschool_name", student_info.prevSchoolName)

        # store current and perm address
        permanent.Address1 = perm_add1
        permanent.Address2 = perm_add2
        permanent.city = perm_city
        permanent.zipCode = perm_zip
        permanent.state = perm_state
        permanent.save()

        current.Address1 = current_add1
        current.Address2 = current_add2
        current.city = current_city
        current.zipCode = current_zip
        current.state = current_state
        current.save()

        student_info.firstName = f_name
        student_info.lastName = l_name
        student_info.dob = sDOB
        student_info.classSection = classSection
        student_info.permanentAddress = perm_add1 + perm_add2
        student_info.gender = gender
        student_info.mobileNumber = phone_number
        student_info.religion = religion
        student_info.caste = caste
        student_info.tcNumber = tc_number
        student_info.aadharNumber = a_number
        student_info.feeWaiverCategory = fee_category
        student_info.siblingID = sibling_id
        student_info.prevSchoolName = prevschool_name
        student_info.save()
        messages.success(request, 'Updated the details')
        return redirect('updateInfo')
    return render(request, 'form/updateInfo.html')


def update_with_data(request, admission_number):
    """
    update form with actual data already filled in for required student
    input: admission number of student and form values

    """
    student_info = StudentInfo.objects.get(admissionNumber=(admission_number
                                                            ))
    p_add = PermanentAddress.objects.filter(student=student_info).first()
    c_add = CurrentAddress.objects.filter(student=student_info).first()
    DOB_to_String = str(student_info.dob)
    return render(request, 'form/updateInfo.html',
                  {"student": student_info, "pAdd": p_add, "cAdd": c_add, "dob": DOB_to_String})


def printinfo(request, admission_number):
    """
    print info for student
    input: admission number of whose data needs to be printed
    output: prints pdf with student details
    """
    student_info = StudentInfo.objects.get(admissionNumber=(admission_number
                                                            ))
    p_add = PermanentAddress.objects.get(student=student_info)
    c_add = CurrentAddress.objects.get(student=student_info)
    parent = ParentInfo.objects.get(student=student_info)
    return render(request, 'form/printStudentData.html',
                  {"student": student_info, "pAdd": p_add, "parent": parent, "cAdd": c_add})


def search(request):
    """
    search students
    input: father's name, admission number,class section and name
    output: list of students matching search query
    """
    if request.method == "GET":

        students = StudentInfo.objects.all()
        # parentInfo = ParentInfo.objects.all()
        if "f_name" in request.GET:
            f_name = request.GET["f_name"]
            students = students.filter(parent__fatherName__icontains=f_name)
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
                # permAdd = PermanentAddress.objects.filter(admissionNumber = student)
                # currentAdd = CurrentAddress.objects.get(admissionNumber = student)
                return render(request, 'form/searchPage.html', {"students": students,"values":request.GET})
            else:
                messages.error(
                    request, 'Cant find student with entered detail')
                return redirect('recordForm')
    return render(request, 'form/searchPage.html')

def upload_excel_data(request):
    if request.method == "POST":
        wb = load_workbook(request.FILES.get("excel"))
        sheet = wb.get_sheet_by_name('Student_Details')
        permanent_sheet = wb.get_sheet_by_name('PermanentAddress')
        current_sheet = wb.get_sheet_by_name('CurrentAddress')
        i = 2
        while sheet[f"A{i}"].value != None:
            student_info = StudentInfo.objects.create(admissionNumber=sheet[f"A{i}"].value)
            student_info.firstName = sheet[f"B{i}"].value
            student_info.lastName = sheet[f"C{i}"].value
            student_info.fullName = sheet[f"B{i}"].value + " " + sheet[f"C{i}"] .value 
            # student_info.attributes = sheet[f"E{i}"]
            student_info.dob = sheet[f"D{i}"].value
            # student_info.permanentAddress = sheet[f"G{i}"]
            student_info.gender = sheet[f"E{i}"].value
            student_info.mobileNumber = sheet[f"F{i}"].value
            student_info.religion = sheet[f"G{i}"].value
            student_info.caste = sheet[f"H{i}"].value
            student_info.tcNumber = sheet[f"I{i}"].value
            student_info.aadharNumber = sheet[f"J{i}"].value
            student_info.feeWaiverCategory = sheet[f"K{i}"].value
            student_info.siblingID = sheet[f"L{i}"].value
            student_info.prevSchoolName = sheet[f"M{i}"].value
            student_info.save()
            parent_info = ParentInfo.objects.create(student=student_info)
            parent_info.fatherName = sheet[f"N{i}"].value
            parent_info.motherName = sheet[f"O{i}"].value
            parent_info.Fatherdob = sheet[f"P{i}"].value
            parent_info.Motherdob = sheet[f"Q{i}"].value
            parent_info.MobileNumber = sheet[f"R{i}"].value
            parent_info.altMobileNumber = sheet[f"S{i}"].value
            # parent_info.gaurdianName = sheet[f"N{i}"]
            parent_info.gaurdianQual = sheet[f"T{i}"].value
            parent_info.guardianOccup =sheet[f"U{i}"].value
            parent_info.email = sheet[f"V{i}"].value
            parent_info.motherOccup = sheet[f"W{i}"].value
            parent_info.motherQual = sheet[f"X{i}"].value
            parent_info.save()
            student_info = StudentInfo.objects.get(admissionNumber=permanent_sheet[f"A{i}"].value)
            permanent = PermanentAddress.objects.create(student=student_info)
            permanent.Address1 = permanent_sheet[f"B{i}"].value
            permanent.Address2 = permanent_sheet[f"C{i}"].value
            permanent.Address = permanent_sheet[f"B{i}"].value + ', '+ permanent_sheet[f"C{i}"].value
            permanent.zipCode = permanent_sheet[f"D{i}"].value
            permanent.state = permanent_sheet[f"E{i}"].value
            permanent.city = permanent_sheet[f"F{i}"].value
            permanent.save()
            student_info = StudentInfo.objects.get(admissionNumber=current_sheet[f"A{i}"].value)
            current = CurrentAddress.objects.create(student=student_info)
            current.Address1 = current_sheet[f"B{i}"].value
            current.Address2 = current_sheet[f"C{i}"].value
            current.Address = current_sheet[f"B{i}"].value + ', '+ current_sheet[f"C{i}"].value
            current.zipCode = current_sheet[f"D{i}"].value
            current.city = current_sheet[f"E{i}"].value
            current.state = current_sheet[f"F{i}"].value
            current.save()
            i+=1
        messages.success(request, 'Data Uploaded Successfully')
    return render(request, 'form/uploadExcelData.html')


def get_students_list(request):
    teacher_profile = UserProfile.objects.get(user=request.user)
    emp_id = teacher_profile.emp_id
    employee = Employee.objects.get(empID=emp_id)
    teacher = Teacher.objects.get(employee=employee)
    class_section=teacher.classTeacher
    students = ClassRoomStudent.objects.filter(classRoom__classSection=class_section)
    return render(request, "form/studentList.html",{"class_room_students":students})


def get_student_credentials(request):  
    user_profile = UserProfile.objects.filter(user_type="Student")
    students = ClassRoomStudent.objects.all()
    myList = zip(user_profile, students)
    return render(request, 'form/credentials.html', {"myList":myList})