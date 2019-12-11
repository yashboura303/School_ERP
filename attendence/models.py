"""
Database tables for attendence app
"""

from django.db import models
from form.models import StudentInfo
from classform.models import ClassRoomStudent
from employeeform.models import Teacher

# Create your models here.


class StudentAttendence(models.Model):
    """
    Student Attendence table
    """
    student = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()

    def __str__(self):
        return f"Name:{self.student.student.fullName}| Date:{self.date} | Status:{self.status}"


class TeacherAttendence(models.Model):
    """
    Teacher Attendence Table
    """
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()
    available_casual_leave = models.IntegerField(default=10)
    available_sick_leave = models.IntegerField(default=10)
    taken_casual_leave = models.IntegerField(default=0)
    taken_sick_leave = models.IntegerField(default=0)
    total_no_of_days_present = models.IntegerField(default=0)

    def __str__(self):
        return f"Name:{self.teacher.fullName}| Date:{self.date} | Status:{self.status}"
