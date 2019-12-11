from django.db import models

# Create your models here.
from classform.models import ClassRoom, ClassRoomStudent

class SubjectsToClass(models.Model):
    classroom = models.OneToOneField(ClassRoom, on_delete=models.CASCADE)
    subjects = models.CharField(max_length=50)


class ExamType(models.Model):
    examType = models.CharField( max_length=50)
    totalMarks =models.IntegerField()

class Marks(models.Model):
    classroomStudent = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    examType = models.OneToOneField(ExamType, on_delete=models.CASCADE)