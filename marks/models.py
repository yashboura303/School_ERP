from django.db import models

# Create your models here.
from classform.models import ClassRoom, ClassRoomStudent

class SubjectsToClass(models.Model):
    classroom = models.OneToOneField(ClassRoom, on_delete=models.CASCADE)
    subjects = models.TextField()
    def __str__(self):
        return f"Class:{self.classroom} | {self.subjects}"

class ExamType(models.Model):
    examType = models.CharField( max_length=50)
    totalMarks =models.IntegerField()
    def __str__(self):
        return f"Class:{self.examType}"

class Marks(models.Model):
    classroomStudent = models.ForeignKey(ClassRoomStudent, on_delete=models.CASCADE)
    examType = models.ForeignKey(ExamType, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    marks =models.IntegerField()
    def __str__(self):
        return f"{self.classroomStudent} | Exam:{self.examType} | Subject:{self.subject}"