"""
Database tables for attendence app
"""

from django.db import models
from form.models import StudentInfo
from employeeform.models import Teacher

# Create your models here.
class StudentAttendence(models.Model):
    """
    Student Attendence table
    """
    student = models.OneToOneField(StudentInfo, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()


class TeacherAttendence(models.Model):
    """
    Teacher Attendence Table
    """
    teacher = models.OneToOneField(Teacher, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()