from django.db import models
from PIL import Image

class Employee(models.Model):
    EmpID = models.IntegerField(primary_key=True,default=0)
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    fullName = models.CharField(max_length=50)
    fatherName = models.CharField(max_length=50)
    motherName = models.CharField(max_length=50)
    partnerName = models.CharField(max_length=50)
    gender = models.CharField(max_length=20)
    email = models.CharField(max_length=40)
    currentAddress = models.CharField(max_length=100)
    permanentAddress = models.CharField(max_length=100)
    dob = models.DateField(null=True)
    joiningDate = models.DateField(null=True)
    bloodGroup = models.CharField(max_length=20)
    mobileNumber = models.BigIntegerField(default=0)
    maritalStatus= models.CharField(max_length=20)
    experience= models.CharField(max_length=20)
    aadharNumber = models.BigIntegerField(default=0)
    empCategory = models.CharField(max_length=20)
 
class Teacher(models.Model):
    employee = models.OneToOneField(Employee,primary_key = True, on_delete=models.CASCADE)
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    fullName = models.CharField(max_length=50)
    specialization = models.CharField(max_length=50)
    designation = models.CharField(max_length=50)
    classTeacher = models.CharField(max_length=50)


class EmployeeDocuments(models.Model):
    employee = models.OneToOneField(Employee,primary_key = True, on_delete=models.CASCADE)
    photo = models.FileField( upload_to='uploads/emp/photograph')
    qualificationDoc = models.FileField( upload_to='uploads/emp/qualificationDocs')
    idProof = models.FileField( upload_to='uploads/emp/idProof')
    addressProof = models.FileField( upload_to='uploads/emp/addressProof')
    otherDoc = models.FileField( upload_to='uploads/emp/otherDoc')

    def save(self,*args, **kwargs):
        super(EmployeeDocuments,self).save(*args, **kwargs)  

        # compress only if IMG file
        try:
            img = Image.open(self.image.path) # Open image using self

            if img.height > 400 or img.width > 400:
                new_img = (400, 400)
                img.thumbnail(new_img)
                img.save(self.image.path)
        
        # else ingore
        except:
            pass