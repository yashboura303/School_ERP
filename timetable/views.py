from django.shortcuts import render
from .models import ClassRoomSubjectTeacher
from employeeform.models import Teacher
from classform.models import ClassRoom
from django.contrib import messages

# Create your views here.


def add_detail(request):
    class_room = request.GET.get("class_room")
    teacher_empID = request.GET.get("teacher_empID")
    subjects = request.GET.get("subjects")
    if class_room and teacher_empID and subjects:
	    ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
	        employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
	    messages.success(request, "Added detail!")
    return render(request, 'timetable/addDetail.html', {"class_rooms": ClassRoom.objects.all(), "teachers": Teacher.objects.all()})

def view_details(request):
	class_room_subject_teachers = ClassRoomSubjectTeacher.objects.all()
	return render(request, 'timetable/detailsList.html',{"class_room_subject_teachers":class_room_subject_teachers})