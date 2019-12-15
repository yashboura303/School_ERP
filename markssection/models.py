from django.db import models
from classform.models import ClassRoom, ClassRoomStudent


class Exam(models.Model):
    examName = models.CharField(max_length=50)
    description = models.TextField()

    def __str__(self):
        return f"Exam :{self.examName}"


class ExamType(models.Model):
    examName = models.ForeignKey(Exam, on_delete=models.CASCADE)
    examType = models.CharField(max_length=50)
    minMarks = models.IntegerField(default=0)
    maxMarks = models.IntegerField()
    priority = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return f"Exam :{self.examName.examName} ExamType:{self.examType}"


class ExamMapping(models.Model):
    examName = models.ForeignKey(Exam, on_delete=models.CASCADE)
    examType = models.ForeignKey(ExamType, on_delete=models.CASCADE)
    classroom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    subject = models.CharField(max_length=100)

    def __str__(self):
        return f"Exam:{self.examName.examName} ExamType:{self.examType.examType}|Subject:{self.subject}"


class Marks(models.Model):
    classroomStudent = models.ForeignKey(
        ClassRoomStudent, on_delete=models.CASCADE)
    examType = models.ForeignKey(ExamType, on_delete=models.CASCADE)
    examName = models.ForeignKey(Exam, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    marks = models.IntegerField()

    def __str__(self):
        return f"{self.classroomStudent.student.fullName} | Exam:{self.examType} | Subject:{self.subject}"


class AdditionalSubjectMapping(models.Model):
    examName = models.ForeignKey(Exam, on_delete=models.CASCADE)
    examType = models.ForeignKey(ExamType, on_delete=models.CASCADE)
    classroomStudent = models.ForeignKey(
        ClassRoomStudent, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    marks = models.IntegerField(blank=True, null=True)
