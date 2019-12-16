"""
Database tables for classform app
"""
from django.db import models
from form.models import StudentInfo
from employeeform.models import Teacher


class ClassRoom(models.Model):
    # standard = models.CharField(max_length=50)
    classSection = models.CharField(max_length=50)
    teacher = models.OneToOneField(Teacher, on_delete=models.CASCADE)

    def __str__(self):
        return f"Class:{self.classSection}| Teacher: {self.teacher.fullName}"


class ClassRoomStudent(models.Model):
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
