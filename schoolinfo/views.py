from django.shortcuts import render
from .models import SchoolInfo
# Create your views here.


def home(request):
    if request.method == "POST":
        schoolName = request.POST.get("school_name")
        addresss = request.POST.get("address")
        principalName = request.POST.get("principal_name")
        email = request.POST.get("email")
        city = request.POST.get("inputCity")
        state = request.POST.get("inputState")
        zipCode = request.POST.get("inputZip")
        schoolID = request.POST.get("school_id")
        longitude = request.POST.get("longitude")
        latitude = request.POST.get("latitude")
        contactNumber = request.POST.get("conact_number")
        webSiteURL = request.POST.get("web_url")
        img = request.FILES.get("school_img")
        logo = request.FILES.get("school_logo")

        SchoolInfo.objects.create(schoolName=schoolName, schoolID=schoolID, email=email, principalName=principalName,
                                  city=city, zipCode=zipCode, logo=logo, img=img, longitude=longitude, latitude=latitude, contactNumber=contactNumber, webSiteURL=webSiteURL, addresss=addresss, state=state)
        messages.success(request, "Added SchoolInfo")
    return render(request, 'schoolinfo/addSchoolInfo.html')
