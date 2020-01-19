from django.db import models
from employeeform.models import Employee
# Create your models here.


class Vehicle(models.Model):
    vehicle_no = models.BigIntegerField()
    device_id = models.BigIntegerField()
    service_id = models.BigIntegerField()
    no_of_seat = models.IntegerField()
    maximum_allowed = models.IntegerField()
    vehicle_type = models.CharField(max_length=30, default="")
    insurance_company = models.CharField(max_length=30, default="")
    contact_person = models.CharField(max_length=30, default="", blank=True)
    insurance_date = models.DateField(null=True, blank=True)
    permit_valid_date = models.DateField(null=True, blank=True)
    pollution_cert_exp_date = models.DateField(null=True, blank=True)
    service_date = models.DateField(null=True, blank=True)
    fitness_service_date = models.DateField(null=True, blank=True)


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'emp/{0}/{1}'.format(instance.employee.empID, filename)


class Driver(models.Model):
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE)
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    driver_name = models.CharField(max_length=30, default="")
    dob = models.DateField(null=True, blank=True)
    license_no = models.BigIntegerField()
    mobile_no = models.BigIntegerField()
    batch_no = models.BigIntegerField()
    contact_address = models.CharField(max_length=30, default="")
    permanent_address = models.CharField(max_length=30, default="")
    driverPic = models.FileField(upload_to=user_directory_path)
    driverLicense = models.FileField(upload_to=user_directory_path)
    driverID = models.FileField(upload_to=user_directory_path)


class Routes(models.Model):
    route_code = models.BigIntegerField()
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    start_place = models.CharField(max_length=30, default="")
    end_place = models.CharField(max_length=30, default="")
    shift_time = models.CharField(max_length=30, default="")
    stoppage_names = models.CharField(max_length=30, default="")
    stoppage_id = models.IntegerField(primary_key=True)
    remarks = models.CharField(max_length=50, default="")
    route_distance = models.IntegerField()
    longitude = models.DecimalField(max_digits=5, decimal_places=2)
    lattitude = models.DecimalField(max_digits=5, decimal_places=2)
