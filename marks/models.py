from django.db import models

# Create your models here.
from classform.models import ClassRoom, ClassRoomStudent

class SubjectsToClass(models.Model):
    classroom = models.OneToOneField(ClassRoom, on_delete=models.CASCADE)
    subjects = models.TextField()


class ExamType(models.Model):
    examType = models.CharField( max_length=50)
    totalMarks =models.IntegerField()

class Marks(models.Model):
    classroomStudent = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    examType = models.ForeignKey(ExamType, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    marks =models.IntegerField()