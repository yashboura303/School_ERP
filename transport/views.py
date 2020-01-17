from django.shortcuts import render
from .models import Vehicle, Routes, Driver
from datetime import date
from employeeform.models import Employee
# Create your views here.


def vehicle_register(request):
    if request.method == "POST":
        vehicle_number = request.POST.get("vehicleNumber")
        device_id = request.POST.get("deviceID")
        no_of_seat = request.POST.get("seats")
        maximum_allowed = request.POST.get("maximum")
        vehicle_type = request.POST.get("vehicleType")
        contact_person = request.POST.get("contactPerson")
        insurance_company = request.POST.get("insuranceCompany")
        insurance_date = request.POST.get("insuranceDate")
        insurance_date = date(*map(int, insurance_date.split('-')))
        pollution_cert_exp_date = request.POST.get("pollutionCertDate")
        pollution_cert_exp_date = date(*map(int, pollution_cert_exp_date.split('-')))
        permit_valid_date = request.POST.get("permitValidDate")
        permit_valid_date = date(*map(int, permit_valid_date.split('-')))
        service_date = request.POST.get("serviceDueDate")
        service_date = date(*map(int, service_date.split('-')))
        service_id = request.POST.get("serviceID")
        fitness_service_date = request.POST.get("fitnessServiceDate")
        fitness_service_date = date(*map(int, fitness_service_date.split('-')))
        Vehicle.objects.create(vehicle_no=vehicle_number, device_id=device_id, service_id=service_id,no_of_seat=no_of_seat, maximum_allowed=maximum_allowed, vehicle_type=vehicle_type, contact_person=contact_person, insurance_company=insurance_company, permit_valid_date=permit_valid_date, insurance_date=insurance_date,pollution_cert_exp_date=pollution_cert_exp_date, fitness_service_date=fitness_service_date, service_date=service_date)
    return render(request, 'transport/vehicleRegister.html')


def driver_register(request):
    vehicles = Vehicle.objects.all()
    if request.method == "POST":
        vehicle_id = request.POST.get("vehicle")
        emp_id = request.POST.get("empID")
        name = request.POST.get("name")
        dob = request.POST.get("dob")
        dob = date(*map(int, dob.split('-')))
        licenseNo = request.POST.get("licenseNo")
        mobileNumber = request.POST.get("mobileNumber")
        caddress = request.POST.get("caddress")
        paddress = request.POST.get("paddress")
        batchNumber = request.POST.get("batchNumber")
        pic = request.FILES.get("pic")
        driver_license = request.FILES.get("driverLicense")
        driverID = request.FILES.get("driverID")
        vehicle = Vehicle.objects.get(id=vehicle_id)
        employee = Employee.objects.get(empID=emp_id)
        Driver.objects.create(employee=employee, vehicle=vehicle,driver_name=name, dob=dob,license_no =licenseNo, mobile_no=mobileNumber, batch_no=batchNumber, contact_address=caddress, permanent_address=paddress, driverID=driverID, driverPic=pic, driverLicense=driver_license)
    return render(request, 'transport/driverRegister.html',{"vehicles":vehicles})