from django.db import models
from PIL import Image

# Create your models here.
class StudentInfo(models.Model):
    firstName = models.CharField(max_length=20)
    lastName = models.CharField(max_length=20)
    fullName = models.CharField(max_length=50)
    fName = models.CharField(max_length=50)
    gender = models.CharField(max_length=20)
    dob = models.DateField(null=True)
    classSection = models.CharField(max_length=20)
    admissionNumber = models.BigIntegerField(primary_key=True,default=0)   
    mobileNumber = models.BigIntegerField(default=0)
    religion= models.CharField(max_length=20)
    caste= models.CharField(max_length=20)
    tcNumber = models.BigIntegerField(default=0)
    aadharNumber = models.BigIntegerField(default=0)
    feeWaiverCategory = models.CharField(max_length=20)
    siblingID = models.BigIntegerField(default=0)
    prevSchoolName = models.CharField(max_length=20)

class CurrentAddress(models.Model):
    student = models.OneToOneField(StudentInfo,primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100)
    Address1 = models.CharField(max_length=100)
    Address2 = models.CharField(max_length=100)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20)
    city = models.CharField(max_length=20)

class PermanentAddress(models.Model):
    student = models.OneToOneField(StudentInfo,primary_key=True, on_delete=models.CASCADE)
    Address = models.CharField(max_length=100)
    Address1 = models.CharField(max_length=100)
    Address2 = models.CharField(max_length=100)
    zipCode = models.BigIntegerField(default=0)
    state = models.CharField(max_length=20)
    city = models.CharField(max_length=20)

class ParentInfo(models.Model):
    student = models.OneToOneField(StudentInfo,primary_key=True, on_delete=models.CASCADE,related_name = 'parent')
    fatherName = models.CharField(max_length=20)
    motherName = models.CharField(max_length=20)
    Fatherdob = models.DateField(null=True)
    Motherdob = models.DateField(null=True)
    MobileNumber = models.BigIntegerField(default=0)
    altMobileNumber = models.BigIntegerField(default=0)
    gaurdianName = models.CharField(max_length=30)
    gaurdianQual = models.CharField(max_length=30)
    guardianOccup = models.CharField(max_length=20)
    email = models.CharField(max_length=30)
    motherQual = models.CharField(max_length=30)
    motherOccup = models.CharField(max_length=20)


def user_directory_path(instance, filename):
# file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'student/{0}/{1}'.format(instance.student.admissionNumber, filename)

class Documents(models.Model):
    student = models.OneToOneField(StudentInfo,primary_key=True, on_delete=models.CASCADE)
    photo = models.FileField( upload_to=user_directory_path)
    idProof = models.FileField( upload_to=user_directory_path)
    castCertificate = models.FileField( upload_to=user_directory_path)
    domicile = models.FileField( upload_to=user_directory_path)
    tc = models.FileField( upload_to=user_directory_path)
    characterCertificate = models.FileField( upload_to=user_directory_path)

    def save(self,*args, **kwargs):
        super(Documents,self).save(*args, **kwargs)  

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












