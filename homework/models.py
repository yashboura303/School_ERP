from django.db import models
from classform.models import ClassRoom, ClassRoomStudent
from django.utils import timezone
# Create your models here.


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'homework/{0}/{1}'.format(instance.classRoom.classSection, filename)


class HomeWork(models.Model):
    classRoom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    description = models.TextField()
    subject = models.CharField(max_length=100)
    document = models.FileField(upload_to=user_directory_path, blank=True)
    date_published = models.DateField()

    def __str__(self):
        return f"Class :{self.classRoom.classSection}| Subject:{self.subject}"


def user_syllabus_path(instance, filename):
    """file will be uploaded to given path"""
    return 'syllabus/{0}/{1}'.format(instance.classRoom.classSection, filename)


class Syllabus(models.Model):
    classRoom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    description = models.TextField()
    document = models.FileField(upload_to=user_syllabus_path, blank=True)
    date_published = models.DateField()
