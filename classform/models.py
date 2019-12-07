from django.db import models
from form.models import StudentInfo
from teacherform.models import Teacher

class ClassRoom(models.Model):
    # standard = models.CharField(max_length=50)
    classSection = models.CharField(max_length=50)
    teacher = models.OneToOneField(Teacher, on_delete = models.CASCADE)

class ClassRoomStudent(models.Model):
    classRoom = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
    rollNumber = models.IntegerField()
    student = models.OneToOneField(StudentInfo, on_delete=models.CASCADE)
    
    def save (self):
        if ClassRoomStudent.objects.filter(classroom = self.classRoom):
            self.rollNumber = ClassRoomStudent.objects.filter(classRoom=self.classRoom).last().rollNumber + 1
        else:
            self.rollNumber = 1
        return super().save()  

