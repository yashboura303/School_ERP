from django.db import models
from classform.models import ClassRoom
from employeeform.models import Teacher
# Create your models here.
class ClassRoomSubjectTeacher(models.Model):
	teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE)
	class_room = models.ForeignKey(ClassRoom, on_delete=models.CASCADE)
	subject = models.CharField(max_length=150)