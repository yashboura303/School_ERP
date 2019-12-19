from django.db import models

# Create your models here.


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'schoolInfo/{0}/{1}'.format(instance.schoolName, filename)


class SchoolInfo(models.Model):
    schoolName = models.CharField(max_length=100)
    addresss = models.CharField(max_length=100)
    principalName = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    zipCode = models.IntegerField()
    schoolID = models.IntegerField(primary_key=True)
    longitude = models.IntegerField()
    latitude = models.IntegerField()
    contactNumber = models.IntegerField()
    webSiteURL = models.CharField(max_length=100)
    img = models.FileField(upload_to=user_directory_path)
    logo = models.FileField(upload_to=user_directory_path)

