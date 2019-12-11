"""
  Handle student registration part
"""
from datetime import date
from django.contrib import messages
from django.shortcuts import render, redirect
from classform.models import ClassRoom, ClassRoomStudent
from .models import StudentInfo, PermanentAddress, CurrentAddress, ParentInfo, Documents


# Create your views here.
def form(request):
    """
    add student info to student and media path for documents
    input: form values

    """
    if request.method == "POST":
        # Student Details
        s_dob = request.POST["sDOB"]
        s_dob = date(*map(int, s_dob.split('-')))
        attributes = request.POST.get("attributes", False)
        f_name = request.POST.get("firstname", False)
        l_name = request.POST.get("lastname", False)
        gender = request.POST.get("gender", False)
        class_section = request.POST.get("classsection", False)
        add_number = request.POST.get("addmissionnumber", False)
        phone_number = request.POST.get("phone_number", False)
        current_add1 = request.POST.get("currentinputAddress", False)
        current_add2 = request.POST.get("currentinputAddress2", False)
        current_city = request.POST.get("inputCity", False)
        current_state = request.POST.get("inputState", False)
        current_zip = request.POST.get("inputZip", False)
        perm_add1 = request.POST.get("perminputAddress", False)
        perm_add2 = request.POST.get("perminputAddress2", False)
        perm_city = request.POST.get("perminputCity", False)
        perm_state = request.POST.get("perminputState", False)
        perm_zip = request.POST.get("perminputZip", False)
        religion = request.POST.get("religion", False)
        caste = request.POST.get("caste", False)
        tc_number = request.POST.get("tcnumber", False)
        anumber = request.POST.get("anumber", False)
        feeCategory = request.POST.get("feeCategory", False)
        siblingid = request.POST.get("siblingid", False)
        prevschool_name = request.POST.get("prevschool_name", False)
        fathername = request.POST.get("fathername", False)
        student_info = StudentInfo.objects.create(admissionNumber=add_number)
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
        student_info.full_name = f_name + l_name
        student_info.attributes = attributes
        student_info.dob = s_dob
        # student_info.classSection = classSection
        student_info.permanentAddress = perm_add1 + perm_add2
        student_info.gender = gender
        student_info.mobileNumber = phone_number
        student_info.religion = religion
        student_info.caste = caste
        student_info.tcNumber = tc_number
        student_info.aadharNumber = anumber
        student_info.feeWaiverCategory = feeCategory
        student_info.siblingID = siblingid
        student_info.f_name = fathername
        student_info.prevSchool_name = prevschool_name
        student_info.save()

        

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
        pattributes = request.POST.get("pattributes", False)
        father_name = request.POST.get("fathername", False)
        mother_name = request.POST.get("mothername", False)
        m_dob = request.POST.get("mDOB", False)
        f_dob = request.POST.get("fDOB", False)
        pphone_number = request.POST.get("pphone_number", False)
        alt_pphone_number = request.POST.get("alt_pphone_number", False)
        gname = request.POST.get("gname", False)
        g_qual = request.POST.get("g_qual", False)
        pemail = request.POST.get("pemail", False)
        m_qual = request.POST.get("m_qual", False)
        m_occup = request.POST.get("m_occup", False)
        g_occup = request.POST.get("g_occup", False)
        mDOB = date(*map(int, mDOB.split('-')))
        fDOB = date(*map(int, fDOB.split('-')))

        parent_info = ParentInfo.objects.create(student=student_info)
        parent_info.attributes = pattributes
        parent_info.fatherName = father_name
        parent_info.motherName = mother_name
        parent_info.Fatherdob = f_dob
        parent_info.Motherdob = m_dob
        parent_info.MobileNumber = pphone_number
        parent_info.altMobileNumber = alt_pphone_number
        parent_info.gaurdianName = gname
        parent_info.gaurdianQual = g_qual
        parent_info.guardianOccup = g_occup
        parent_info.email = pemail
        parent_info.motherQual = m_qual
        parent_info.motherQual = m_occup
        parent_info.save()

        documents = Documents.objects.create(student=student_info)
        documents.idProof = request.FILES["idproof"]
        documents.photo = request.FILES["photgraph"]
        documents.castCertificate = request.FILES["castcert"]
        documents.domicile = request.FILES["domicile"]
        documents.tc = request.FILES["tc"]
        documents.characterCertificate = request.FILES["charcert"]
        documents.save()
        messages.success(request, "Record successfully added")

    return render(request, 'form/recordForm.html')


def update(request):
    """
    update student info in student table
    input: form values
    """
    if request.method == "POST":
        # Student Details

        if not request.POST.get("addmissionnumber"):
            messages.info(request, 'Enter addmission Number!')
            return redirect('updateInfo')
        else:
            add_number = request.POST.get("addmissionnumber")
            student_info = StudentInfo.objects.get(
                admissionNumber=int(add_number))
            permanent = PermanentAddress.objects.get(
                admissionNumber=student_info)
            current = CurrentAddress.objects.get(admissionNumber=student_info)
            sDOB = request.POST.get["sDOB"]
            sDOB = date(*map(int, sDOB.split('-')))
            attributes = request.POST.get("attributes", False)
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
                "prevschool_name", student_info.prevSchool_name)

            # store current and perm address
            permanent.Address1 = perm_add1
            permanent.Address2 = perm_add2
            permanent.city = perm_city
            permanent.zipCode = perm_zip
            permanent.state = perm_state

            current.Address1 = current_add1
            current.Address2 = current_add2
            current.city = current_city
            current.zipCode = current_zip
            current.state = current_state

            student_info.firstName = f_name
            student_info.lastName = l_name
            student_info.attributes = attributes
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
            student_info.prevSchool_name = prevschool_name
            student_info.save()
            messages.info(request, 'Updated the details')
            return redirect('updateInfo')
    return render(request, 'form/updateInfo.html')


def update_with_data(request, admission_number):
    """
    update form with actual data already filled in for required student
    input: admission number of student and form values

    """
    student_info = StudentInfo.objects.get(admissionNumber=(admission_number
                                                            ))
    p_add = PermanentAddress.objects.get(student=student_info)
    c_add = CurrentAddress.objects.get(student=student_info)
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
            # studentsInfo = studentsInfo.filter(f_name__icontains = f_name)
            students = students.filter(parent__fatherName__icontains=f_name)
        if "name" in request.GET:
            name = request.GET["name"]
            students = students.filter(full_name__icontains=name)
        if "classSection" in request.GET:
            class_section = request.GET["classSection"]
            students = students.filter(classSection__icontains=class_section)
        if "add_number" in request.GET:
            add_no = request.GET["add_number"]
            students = students.filter(admissionNumber__icontains=(add_no))
            if students:
                # permAdd = PermanentAddress.objects.filter(admissionNumber = student)
                # currentAdd = CurrentAddress.objects.get(admissionNumber = student)
                return render(request, 'form/searchPage.html', {"students": students})
            else:
                messages.error(
                    request, 'Cant find student with entered detail')
                return redirect('recordForm')
    return render(request, 'form/searchPage.html')
