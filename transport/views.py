from django.shortcuts import render
from .models import Vehicle
# Create your views here.
def transport(request):
    if request.method == "GET":
        vehicle_number = request.GET.get("vehicleNumber")
        device_id = request.GET.get("deviceID")
        no_of_seat = request.GET.get("seats")
        maximum_allowed = request.GET.get("maximum")
        vehicle_type = request.GET.get("vehicleType")
        contact_person = request.GET.get("contactPerson")
        insurance_company = request.GET.get("insuranceCompany")
        insurance_date = request.GET.get("insuranceDate")
        pollution_cert_exp_date = request.GET.get("pollutionCertDate")
        permit_valid_date = request.GET.get("permitValidDate")
        vehicle_number = request.GET.get("serviceDueDate")
        service_id = request.GET.get("serviceID")
        fitness_service_date = request.GET.get("fitnessServiceDate")
        Vehicle.objects.create(vehicle_no=vehicle_number, device_id=device_id, service_id=service_id,no_of_seat=no_of_seat, maximum_allowed=maximum_allowed, vehicle_type=vehicle_type, contact_person=contact_person, insurance_company=insurance_company, permit_valid_date=permit_valid_date, pollution_cert_exp_date=pollution_cert_exp_date, fitness_service_date=fitness_service_date)
    return render(request, 'transport/home.html')