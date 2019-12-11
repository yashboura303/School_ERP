"""
Tables for employeeform
"""
from django.db import models
from PIL import Image


class Employee(models.Model):
    """Employee table"""
    empID = models.IntegerField(primary_key=True, default=0)
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    fullName = models.CharField(max_length=50)
    father_name = models.CharField(max_length=50)
    mother_name = models.CharField(max_length=50)
    partnerName = models.CharField(max_length=50)
    gender = models.CharField(max_length=20)
    email = models.CharField(max_length=40)
    currentAddress = models.CharField(max_length=100)
    permanentAddress = models.CharField(max_length=100)
    dob = models.DateField(null=True)
    joiningDate = models.DateField(null=True)
    bloodGroup = models.CharField(max_length=20)
    mobile_number = models.BigIntegerField(default=0)
    marital_status = models.CharField(max_length=20)
    experience = models.CharField(max_length=20)
    aadharNumber = models.BigIntegerField(default=0)
    empCategory = models.CharField(max_length=20)

    def __str__(self):
        return f"Name:{self.fullName}| Cateogry:{self.empCategory}| Emp.ID: {self.empID}"


class CurrentAddress(models.Model):
    """Currrent Address Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100)
    Address1 = models.CharField(max_length=100)
    Address2 = models.CharField(max_length=100)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20)
    city = models.CharField(max_length=20)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class PermanentAddress(models.Model):
    """Permanent Address Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100)
    Address1 = models.CharField(max_length=100)
    Address2 = models.CharField(max_length=100)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20)
    city = models.CharField(max_length=20)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class Teacher(models.Model):
    """ Teacher Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE)
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    fullName = models.CharField(max_length=50)
    specialization = models.CharField(max_length=50)
    designation = models.CharField(max_length=50)
    classTeacher = models.CharField(max_length=50)

    def __str__(self):
        return f"Name:{self.fullName}| Class:{self.classTeacher}| Emp.ID: {self.employee.empID}"


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'emp/{0}/{1}'.format(instance.employee.empID, filename)


class EmployeeDocuments(models.Model):
    """ Employee Document Table"""
    employee = models.OneToOneField(
        Employee, primary_key=True, on_delete=models.CASCADE)
    photo = models.FileField(upload_to=user_directory_path)
    qualificationDoc = models.FileField(upload_to=user_directory_path)
    IdProof = models.FileField(upload_to=user_directory_path)
    addressProof = models.FileField(upload_to=user_directory_path)
    otherDoc = models.FileField(upload_to=user_directory_path)

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
