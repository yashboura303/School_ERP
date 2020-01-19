from django.shortcuts import render, HttpResponse
from xhtml2pdf import pisa
from io import BytesIO
from django.template import Context
from .models import Vehicle, Routes, Driver
from datetime import date
from employeeform.models import Employee
from .admin import VehicleList
from django.template.loader import get_template
# Create your views here.


def vehicle_register(request):
    """
    Register new vehicle
    """
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
        pollution_cert_exp_date = date(
            *map(int, pollution_cert_exp_date.split('-')))
        permit_valid_date = request.POST.get("permitValidDate")
        permit_valid_date = date(*map(int, permit_valid_date.split('-')))
        service_date = request.POST.get("serviceDueDate")
        service_date = date(*map(int, service_date.split('-')))
        service_id = request.POST.get("serviceID")
        fitness_service_date = request.POST.get("fitnessServiceDate")
        fitness_service_date = date(*map(int, fitness_service_date.split('-')))
        Vehicle.objects.create(vehicle_no=vehicle_number, device_id=device_id, service_id=service_id, no_of_seat=no_of_seat, maximum_allowed=maximum_allowed, vehicle_type=vehicle_type, contact_person=contact_person,
                               insurance_company=insurance_company, permit_valid_date=permit_valid_date, insurance_date=insurance_date, pollution_cert_exp_date=pollution_cert_exp_date, fitness_service_date=fitness_service_date, service_date=service_date)
    return render(request, 'transport/vehicleRegister.html')


def driver_register(request):
    """
    Regsiter new driver 
    """
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
        Driver.objects.create(employee=employee, vehicle=vehicle, driver_name=name, dob=dob, license_no=licenseNo, mobile_no=mobileNumber,
                              batch_no=batchNumber, contact_address=caddress, permanent_address=paddress, driverID=driverID, driverPic=pic, driverLicense=driver_license)
    return render(request, 'transport/driverRegister.html', {"vehicles": vehicles})


def route_register(request):
    if request.method == "POST":
        vehicle_id = request.POST.get("vehicle")
        route_code = request.POST.get("route_code")
        start_place = request.POST.get("start_place")
        end_place = request.POST.get("end_place")
        route_distance = request.POST.get("route_distance")
        remarks = request.POST.get("remarks")
        shift = request.POST.get("shift")
        stoppage_name = request.POST.get("stoppage_name")
        stoppage_id = request.POST.get("stoppage_id")
        longitude = request.POST.get("longitude")
        lattitude = request.POST.get("lattitude")
        vehicle = Vehicle.objects.get(id=vehicle_id)
        stoppage_id = str(route_code) + stoppage_id
        Routes.objects.create(vehicle=vehicle, route_code=route_code, start_place=start_place, end_place=end_place, shift_time=shift,
                              stoppage_names=stoppage_name, stoppage_id=stoppage_id, remarks=remarks, route_distance=route_distance, longitude=longitude, lattitude=lattitude)
    return render(request, 'transport/routeRegister.html', {"vehicles": Vehicle.objects.all()})


def vehicle_list(request):
    """
    Render all registered vehicle list
    """
    return render(request, 'transport/vehicleList.html', {"vehicles": Vehicle.objects.all()})


def vehicle_list_excel(request):
    """
    Export vehicle list to excel sheet
    """
    dataset = VehicleList().export()
    response = HttpResponse(content_type='application/vnd.ms-excel')
    response['Content-Disposition'] = 'attachment;filename="vehicle-list.xlsx"'
    response.write(dataset.xlsx)
    return response

def vehicle_list_pdf(request):
    # context_dict = {"vehicles":Vehicle.objects.all()}
    # template = get_template('transport/vehicleListPdf.html')
    # html  = template.render(context_dict)
    # result = BytesIO()
    # pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
    # if not pdf.err:
    #     return HttpResponse(result.getvalue(), content_type='application/pdf')
    # return None

    template_path = 'transport/vehicleListPdf.html'
    context = {"vehicles":Vehicle.objects.all()}
    # Create a Django response object, and specify content_type as pdf
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="vehicle-list.pdf"'
    # find the template and render it.
    template = get_template(template_path)
    html = template.render((context))

    # create a pdf
    pisaStatus = pisa.CreatePDF(
       html, dest=response)
    # if error then show some funy view
    if pisaStatus.err:
       return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response