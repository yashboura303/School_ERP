from django.db import models

# Create your models here.
class DeletedStudentInfo(models.Model):
    """Student Table"""
    firstName = models.CharField(max_length=20,blank=True)
    lastName = models.CharField(max_length=20,blank=True)
    fullName = models.CharField(max_length=50,blank=True)
    gender = models.CharField(max_length=20,blank=True)
    dob = models.DateField(null=True,blank=True)
    classSection = models.CharField(max_length=20,blank=True)
    admissionNumber = models.BigIntegerField(primary_key=True)
    mobileNumber = models.BigIntegerField(null=True,blank=True)
    religion = models.CharField(max_length=20,blank=True)
    caste = models.CharField(max_length=20,blank=True)
    tcNumber = models.BigIntegerField(null=True,blank=True)
    aadharNumber = models.BigIntegerField(null=True,blank=True)
    feeWaiverCategory = models.CharField(max_length=20,blank=True)
    prevSchoolName = models.CharField(max_length=20,blank=True)

class DeletedCurrentAddress(models.Model):
    """Currrent Address Table"""
    student = models.OneToOneField(
        DeletedStudentInfo, primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100,blank=True)
    Address1 = models.CharField(max_length=100,blank=True)
    Address2 = models.CharField(max_length=100,blank=True)
    zipCode = models.BigIntegerField(null=True,blank=True)
    state = models.CharField(max_length=20,blank=True)
    city = models.CharField(max_length=20,blank=True)

    def __str__(self):
        return f"Name:{self.student.fullName}"


class DeletedPermanentAddress(models.Model):
    """Permanent Address Table"""
    student = models.OneToOneField(
        DeletedStudentInfo, primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100,blank=True)
    Address1 = models.CharField(max_length=100,blank=True)
    Address2 = models.CharField(max_length=100,blank=True)
    zipCode = models.BigIntegerField(null=True,blank=True)
    state = models.CharField(max_length=20,blank=True)
    city = models.CharField(max_length=20,blank=True)

    def __str__(self):
        return f"Name:{self.student.fullName}"


class DeletedParentInfo(models.Model):
    """ Parents Info Table"""
    student = models.OneToOneField(
        DeletedStudentInfo, primary_key=True, on_delete=models.CASCADE, related_name='parent')
    fatherName = models.CharField(max_length=20,blank=True)
    motherName = models.CharField(max_length=20,blank=True)
    Fatherdob = models.DateField(null=True,blank=True)
    Motherdob = models.DateField(null=True,blank=True)
    MobileNumber = models.BigIntegerField(null=True,blank=True)
    altMobileNumber = models.BigIntegerField(null=True,blank=True)
    gaurdianQual = models.CharField(max_length=30,blank=True)
    guardianOccup = models.CharField(max_length=20,blank=True)
    email = models.CharField(max_length=30,blank=True)
    motherQual = models.CharField(max_length=30,blank=True)
    motherOccup = models.CharField(max_length=20,blank=True)

    def __str__(self):
        return f"Student:{self.student.fullName} Add.No: {self.student.admissionNumber} Father Name:{self.fatherName}"

class DeletedEmployee(models.Model):
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


class DeletedEmployeeCurrentAddress(models.Model):
    """Currrent Address Table"""
    employee = models.OneToOneField(
        DeletedEmployee, primary_key=True, on_delete=models.CASCADE, blank=True)
    Address = models.CharField(max_length=100, blank=True)
    Address1 = models.CharField(max_length=100, blank=True)
    Address2 = models.CharField(max_length=100, blank=True)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20, blank=True)
    city = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class DeletedEmployeePermanentAddress(models.Model):
    """Permanent Address Table"""
    employee = models.OneToOneField(
        DeletedEmployee, primary_key=True, on_delete=models.CASCADE, blank=True)
    Address = models.CharField(max_length=100, blank=True)
    Address1 = models.CharField(max_length=100, blank=True)
    Address2 = models.CharField(max_length=100, blank=True)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20, blank=True)
    city = models.CharField(max_length=20, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}"


class DeletedTeacher(models.Model):
    """ Teacher Table"""
    employee = models.OneToOneField(
        DeletedEmployee, primary_key=True, on_delete=models.CASCADE, blank=True)
    specialization = models.CharField(max_length=50, blank=True)
    designation = models.CharField(max_length=50, blank=True)
    classTeacher = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return f"Name:{self.employee.fullName}| Class:{self.classTeacher}| Emp.ID: {self.employee.empID}"