from django.shortcuts import render,redirect
from . models import StudentInfo, PermanentAddress,CurrentAddress,ParentInfo,Documents
from datetime import date
from django.contrib import messages
# Create your views here.
def form(request):
        
    if request.method == "POST":
        # Student Details
        sDOB = request.POST["sDOB"]
        sDOB = date(*map(int, sDOB.split('-')))
        attributes = request.POST.get("attributes", False)
        fName = request.POST.get("firstname", False)
        lName = request.POST.get("lastname", False)
        gender = request.POST.get("gender", False)
        sDOB = request.POST.get("sDOB", False)
        classSection = request.POST.get("classection", False)
        addNumber = request.POST.get("addmissionnumber", False)
        phoneNumber = request.POST.get("phonenumber", False)
        currentAdd1 = request.POST.get("currentinputAddress", False)
        currentAdd2 = request.POST.get("currentinputAddress2", False)
        currentCity = request.POST.get("inputCity", False)
        currentState = request.POST.get("inputState", False)
        currentZip = request.POST.get("inputZip", False)
        permAdd1 = request.POST.get("perminputAddress", False)
        permAdd2 = request.POST.get("perminputAddress2", False)
        permCity = request.POST.get("perminputCity", False)
        permState = request.POST.get("perminputState", False)
        permZip = request.POST.get("perminputZip", False)
        religion = request.POST.get("religion", False)
        caste = request.POST.get("caste", False)
        tcnumber = request.POST.get("tcnumber", False)
        anumber = request.POST.get("anumber", False)
        feeCategory = request.POST.get("feeCategory", False)
        siblingid = request.POST.get("siblingid", False)
        prevschoolname = request.POST.get("prevschoolname", False)
        fathername = request.POST.get("fathername", False)

        student_info = StudentInfo.objects.create(admissionNumber = addNumber)
        student_info.firstName = fName
        student_info.lastName = lName
        student_info.fullName = fName + lName
        student_info.attributes = attributes
        student_info.dob = sDOB
        student_info.classSection = classSection
        student_info.permanentAddress = permAdd1 + permAdd2
        student_info.gender = gender
        student_info.mobileNumber = phoneNumber
        student_info.religion = religion
        student_info.caste = caste
        student_info.tcNumber = tcnumber
        student_info.aadharNumber = anumber
        student_info.feeWaiverCategory = feeCategory
        student_info.siblingID = siblingid
        student_info,fName = fathername
        student_info.prevSchoolName = prevschoolname
        student_info.save()

        permanent = PermanentAddress.objects.create(admissionNumber = student_info)
        permanent.Address = permAdd1+ permAdd2
        permanent.zipCode = permZip
        permanent.state = permState
        permanent.city = permCity

        current = CurrentAddress.objects.create(admissionNumber = student_info)
        current.Address = currentAdd1+ currentAdd2
        current.zipCode = currentZip
        current.city = currentCity
        current.state = currentState
        


        #Parent Details
        pattributes = request.POST.get("pattributes", False)
        fathername = request.POST.get("fathername", False)
        mothername = request.POST.get("mothername", False)
        mDOB = request.POST.get("mDOB", False)
        fDOB = request.POST.get("fDOB", False)
        paddmissionnumber = request.POST.get("paddmissionnumber", False)
        pphonenumber = request.POST.get("pphonenumber", False)
        alt_pphonenumber = request.POST.get("alt_pphonenumber", False)
        gname = request.POST.get("gname", False)
        g_qual = request.POST.get("g_qual", False)
        pemail = request.POST.get("pemail", False)
        m_qual = request.POST.get("m_qual", False)
        m_occup = request.POST.get("m_occup", False)
        g_occup = request.POST.get("g_occup", False)
        mDOB = date(*map(int, mDOB.split('-')))
        fDOB = date(*map(int, fDOB.split('-')))
        
        parent_info = ParentInfo.objects.create(admissionNumber = student_info)
        parent_info.attributes = pattributes
        parent_info.fatherName = fathername
        parent_info.motherName = mothername
        parent_info.Fatherdob = fDOB
        parent_info.Motherdob = mDOB
        parent_info.MobileNumber = pphonenumber
        parent_info.altMobileNumber = alt_pphonenumber
        parent_info.gaurdianName = gname
        parent_info.gaurdianQual = g_qual
        parent_info.guardianOccup = g_occup
        parent_info.email = pemail
        parent_info.motherQual = m_qual
        parent_info.motherQual = m_occup       
        parent_info.save()

        documents = Documents.objects.create(admissionNumber = student_info)
        documents.idProof = request.FILES["idproof"]
        documents.photograph = request.FILES["photgraph"]
        documents.castCertificate = request.FILES["castcert"]
        documents.domicile = request.FILES["domicile"]
        documents.tc = request.FILES["tc"]
        documents.characterCertificate = request.FILES["charcert"]
        documents.save()

    return render(request,'recordForm.html')



def update(request):

    if request.method == "POST":
        # Student Details

        if not request.POST.get("addmissionnumber"):
            messages.info(request, 'Enter addmission Number!')
            return redirect('updateInfo.html')
        else:
            addNumber = request.POST.get("addmissionnumber")
            student_info = StudentInfo.objects.get(admissionNumber = int(addNumber))
            permanent = PermanentAddress.objects.get(admissionNumber = student_info)
            current = CurrentAddress.objects.get(admissionNumber = student_info)
            sDOB = request.POST.get["sDOB"]
            sDOB = date(*map(int, sDOB.split('-')))
            attributes = request.POST.get("attributes", False)
            fName = request.POST.get("firstname", student_info.firstName)
            lName = request.POST.get("lastname", student_info.lastName)
            gender = request.POST.get("gender", student_info.gender)
            sDOB = request.POST.get("sDOB", student_info.dob)
            classSection = request.POST.get("classection", student_info.classSection)
            phoneNumber = request.POST.get("phonenumber", student_info.mobileNumber)
            currentAdd1 = request.POST.get("currentinputAddress", current.Address)
            currentAdd2 = request.POST.get("currentinputAddress2", "")
            currentCity = request.POST.get("inputCity", current.city)
            currentState = request.POST.get("inputState", current.state)
            currentZip = request.POST.get("inputZip", current.zipCode)
            permAdd1 = request.POST.get("perminputAddress",  permanent.Address)
            permAdd2 = request.POST.get("perminputAddress2", "")
            permCity = request.POST.get("perminputCity", permanent.city)
            permState = request.POST.get("perminputState", permanent.state)
            permZip = request.POST.get("perminputZip", permanent.zipCode)
            religion = request.POST.get("religion", student_info.religion)
            caste = request.POST.get("caste", student_info.caste)
            tcnumber = request.POST.get("tcnumber", student_info.tcNumber)
            anumber = request.POST.get("anumber", student_info.aadharNumber)
            feeCategory = request.POST.get("feeCategory", student_info.feeWaiverCategory)
            siblingid = request.POST.get("siblingid", student_info.siblingID)
            prevschoolname = request.POST.get("prevschoolname", student_info.prevSchoolName)

            student_info.firstName = fName
            student_info.lastName = lName
            student_info.attributes = attributes
            student_info.dob = sDOB
            student_info.classSection = classSection
            student_info.permanentAddress = permAdd1 + permAdd2
            student_info.gender = gender
            student_info.mobileNumber = phoneNumber
            student_info.religion = religion
            student_info.caste = caste
            student_info.tcNumber = tcnumber
            student_info.aadharNumber = anumber
            student_info.feeWaiverCategory = feeCategory
            student_info.siblingID = siblingid
            student_info.prevSchoolName = prevschoolname
            student_info.save()
            messages.info(request, 'Updated the details')
            return redirect('updateInfo.html')
    return render(request, 'updateInfo.html')


def search(request):
    if request.method == "GET":

        studentsInfo = StudentInfo.objects.all()
        parentInfo = ParentInfo.objects.all()
        # if "fname" in request.GET:
        #     fName = request.GET["fname"]
        #     # studentsInfo = studentsInfo.filter(fName__icontains = fName)
        #     studentsInfo = StudentInfo.objects.filter(parent__fatherName = fName)
        #     print(studentsInfo)
        if "name" in request.GET:
            name = request.GET["name"]
            studentInfo = studentsInfo.filter(fullName__icontains = name)
        if "classSection" in request.GET:
            classSection = request.GET["classSection"]
            studentInfo = studentsInfo.filter(classSection__icontains = classSection)
        if "addNumber" in request.GET:
            addNo = request.GET["addNumber"]
            studentInfo = studentsInfo.filter(admissionNumber__icontains = (addNo))
            if studentInfo:
                # permAdd = PermanentAddress.objects.filter(admissionNumber = student)
                # currentAdd = CurrentAddress.objects.get(admissionNumber = student)
                return render(request, 'searchPage.html',{"students":studentInfo})
            else:
                messages.error(request, 'Cant find student with entered detail')
                return redirect('recordForm')
    return render(request, 'searchPage.html')