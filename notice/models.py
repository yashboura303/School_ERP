from django.db import models
from classform.models import ClassRoom, ClassRoomStudent
# Create your models here.


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'notice/{0}/{1}'.format(instance.classRoom.classSection, filename)


def student_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'notice/{0}/{1}'.format(instance.student.student.admissionNumber, filename)


class ClassNotice(models.Model):
    notice = models.TextField()
    classRoom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    notice_document = models.FileField(
        upload_to=user_directory_path, blank=True)


class StudentNotice(models.Model):
    student = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    notice = models.TextField()
    notice_document = models.FileField(
        upload_to=student_directory_path, blank=True)
