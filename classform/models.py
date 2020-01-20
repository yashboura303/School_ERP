"""
Database tables for classform app
"""
from django.db import models
from form.models import StudentInfo
from employeeform.models import Teacher
from datetime import datetime


class ClassRoom(models.Model):
    """
    Table for Class Room details with Class/Section and Class Teacher Assigned
    """
    classSection = models.CharField(max_length=50)
    teacher = models.OneToOneField(Teacher, on_delete=models.CASCADE)

    def __str__(self):
        return f"Class:{self.classSection}| Teacher: {self.teacher.fullName}"


def user_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'report-card/{0}/{1}'.format(instance.class_room_student.student.admissionNumber, filename)


class ClassRoomStudent(models.Model):
    """
    Table for Student related to a classroom with roll number and student(foreign key) attributes
    """
    classRoom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    roll_number = models.IntegerField()
    student = models.OneToOneField(StudentInfo, on_delete=models.CASCADE)

    def __str__(self):
        return f"Class:{self.classRoom.classSection}| Student:{self.student.fullName}"

    def save(self, *args, **kwargs):
        if len(ClassRoomStudent.objects.filter(classRoom=self.classRoom)) > 0:
            self.roll_number = ClassRoomStudent.objects.filter(
                classRoom=self.classRoom).last().roll_number + 1
        else:
            self.roll_number = 1
        return super(ClassRoomStudent, self).save(*args, **kwargs)

class ReportCard(models.Model):
    """
    Table for Report Card for a class room student
    """
    class_room_student = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    reportCard = models.FileField(upload_to=user_directory_path)

class StudentRouteAttendence(models.Model):
    """
    Student Attendence table
    """
    student = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)
    date = models.DateField()
    time = models.DateTimeField(default=datetime.now, blank=True)

    def __str__(self):
        return f"Name:{self.student.student.fullName}| Date:{self.date} | Status:{self.status}"

