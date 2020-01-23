from django.db import models
from employeeform.models import Employee
from form.models import StudentInfo
# Create your models here.
class EmployeeLeave(models.Model):
	employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
	description = models.TextField()
	subject = models.CharField(max_length=20)
	date_from = models.DateField()
	date_to = models.DateField()
	approved = models.BooleanField(default=False)
	rejected = models.BooleanField(default=False)

class StudentLeave(models.Model):
	student = models.ForeignKey(StudentInfo, on_delete=models.CASCADE)
	description = models.TextField()
	subject = models.CharField(max_length=20)
	date_from = models.DateField()
	date_to = models.DateField()
	approved = models.BooleanField(default=False)
	rejected = models.BooleanField(default=False)
