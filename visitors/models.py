from django.db import models
from datetime import datetime
# Create your models here.
def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'visitor/{0}/{1}'.format(instance.name, filename)

class Visitor(models.Model):
	name = models.CharField(max_length=30)
	mobile_no = models.BigIntegerField()
	date_time = models.DateTimeField()
	contact_to = models.CharField(max_length=30)
	address = models.CharField(max_length=50)
	purpose = models.TextField(max_length=30)
	photo = models.FileField(upload_to=user_directory_path)
	document = models.FileField(upload_to=user_directory_path)

