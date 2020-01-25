from django.shortcuts import render, HttpResponse, redirect
from xhtml2pdf import pisa
from io import BytesIO
from django.template import Context
from .models import Vehicle, Routes, Driver
from form.models import StudentRoute, StudentInfo
from accounts.models import UserProfile
from datetime import date
from django.contrib import messages
from employeeform.models import Employee
from .admin import VehicleList
from django.template.loader import get_template
from classform.models import StudentRouteAttendence, ClassRoomStudent
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
    """
    Export vehicle list to pdf 
    """
    template_path = 'transport/vehicleListPdf.html'
    context = {"vehicles": Vehicle.objects.all()}
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


def route_attendence(request):
    routes = Routes.objects.all()
    if request.method == "POST":
        route_code = request.POST.get("route_code")
        student_routes = StudentRoute.objects.filter(route_code=route_code)
        return render(request, 'transport/routeAttendence.html', {"routes": Routes.objects.all(), "student_routes": student_routes})
    return render(request, 'transport/routeAttendence.html', {"routes": routes})


def mark_attendence(request):
    routes = Routes.objects.all()
    if request.method == "POST":
        if "date" in request.POST:
            _date = request.POST["date"]
            _date = date(*map(int, _date.split('-')))
            if _date.weekday() == 6:
                messages.info(request, "Selected Date is a holiday!")
                redirect('routeAttendence')
            class_students = ClassRoomStudent.objects.all()

            for s in class_students:
                print(str(s.student.admissionNumber))
                if str(s.student.admissionNumber) in request.POST:
                    StudentRouteAttendence.objects.create(status=request.POST[str(
                        s.student.admissionNumber)], date=_date, student=s)
            messages.success(request, "Marked Attendence")
            redirect('routeAttendence')
    return render(request, 'transport/routeAttendence.html', {"routes": routes})


def route_report(request):
    if request.method == "POST":
        route_code = request.POST.get("route_code")
        request.session["route_code"] = route_code
        routes_list = Routes.objects.filter(route_code=route_code)
        student_routes_list = StudentRoute.objects.filter(
            route_code=route_code)
        mylist = zip(routes_list, student_routes_list)
        return render(request, 'transport/report.html', {"routes": Routes.objects.all(), "my_list": mylist})
    return render(request, 'transport/report.html', {"routes": Routes.objects.all()})


def route_report_pdf(request):
    """
    Export route report to pdf 
    """
    route_code = request.session["route_code"]
    routes_list = Routes.objects.filter(route_code=route_code)
    student_routes_list = StudentRoute.objects.filter(route_code=route_code)
    mylist = zip(routes_list, student_routes_list)
    template_path = 'transport/routeReportPdf.html'
    context = {"my_list": mylist}
    # Create a Django response object, and specify content_type as pdf
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="route-report.pdf"'
    # find the template and render it.
    template = get_template(template_path)
    html = template.render((context))

    # create a pdf
    pisaStatus = pisa.CreatePDF(
        html, dest=response)
    if pisaStatus.err:
        return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response

def get_student_transport_route(request):
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Student":
        addmission_number = user_profile.addmission_number
        student_route = StudentRoute.objects.get(student__admissionNumber=addmission_number)
        route_code = student_route.route_code
        route = Routes.objects.get(route_code=route_code)
        vehicle = route.vehicle
        driver = Driver.objects.get(vehicle=vehicle)
        context = {
        "student_route":student_route,
            "route":route,
            "driver":driver
        }
        return render(request, 'transport/getStudentRoute.html', context)

