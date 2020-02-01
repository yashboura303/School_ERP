"""
Tables for employeeform
"""
from django.db import models
from PIL import Image


class Employee(models.Model):
    """Employee table"""
    empID = models.IntegerField(primary_key=True, default=0)
    firstName = models.CharField(max_length=20, blank=True)
    lastName = models.CharField(max_length=20, blank=True)
    fullName = models.CharField(max_length=50, blank=True)
    father_name = models.CharField(max_length=50, blank=True)
    mother_name = models.CharField(max_length=50, blank=True)
    partnerName = models.CharField(max_length=50, blank=True)
    gender = models.CharField(max_length=20,blank=True)
    email = models.CharField(max_length=40,blank=True)
    currentAddress = models.CharField(max_length=100, blank=True)
    permanentAddress = models.CharField(max_length=100, blank=True)
    dob = models.DateField(null=True, blank=True)
    joiningDate = models.DateField(null=True, blank=True)
    bloodGroup = models.CharField(max_length=20, blank=True)
    mobile_number = models.BigIntegerField(default=0)
    marital_status = models.CharField(max_length=20, blank=True)
    experience = models.CharField(max_length=20, blank=True)
    aadharNumber = models.BigIntegerField(default=0)
    empCategory = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f"Name:{self.fullName}| Cateogry:{self.empCategory}| Emp.ID: {self.empID}"


class CurrentAddress(models.Model):
    """Currrent Address Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE, blank=True)
    Address = models.CharField(max_length=100, blank=True)
    Address1 = models.CharField(max_length=100, blank=True)
    Address2 = models.CharField(max_length=100, blank=True)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20, blank=True)
    city = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class PermanentAddress(models.Model):
    """Permanent Address Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE, blank=True)
    Address = models.CharField(max_length=100, blank=True)
    Address1 = models.CharField(max_length=100, blank=True)
    Address2 = models.CharField(max_length=100, blank=True)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20, blank=True)
    city = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class Teacher(models.Model):
    """ Teacher Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE, blank=True)
    specialization = models.CharField(max_length=50, blank=True)
    designation = models.CharField(max_length=50, blank=True)
    classTeacher = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}| Class:{self.classTeacher}| Emp.ID: {self.employee.empID}"


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'emp/{0}/{1}'.format(instance.employee.empID, filename)


class EmployeeDocuments(models.Model):
    """ Employee Document Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE, blank=True)
    photo = models.FileField(upload_to=user_directory_path, blank=True)
    qualificationDoc = models.FileField(upload_to=user_directory_path, blank=True)
    IdProof = models.FileField(upload_to=user_directory_path, blank=True)
    addressProof = models.FileField(upload_to=user_directory_path, blank=True)
    otherDoc = models.FileField(upload_to=user_directory_path, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}"

    def save(self, *args, **kwargs):
        super(EmployeeDocuments, self).save(*args, **kwargs)

        # compress only if IMG file
        try:
            img = Image.open(self.image.path)  # Open image using self

            if img.height > 400 or img.width > 400:
                new_img = (400, 400)
                img.thumbnail(new_img)
                img.save(self.image.path)

        # else ingore
        except:
            pass
