from django.shortcuts import render
from . models import StudentInfo, PermanentAddress,CurrentAddress,ParentInfo,Documents
from datetime import date
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

        student_info = StudentInfo.objects.create(admissionNumber = addNumber)
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