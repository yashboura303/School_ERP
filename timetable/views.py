from django.shortcuts import render
from .models import ClassRoomSubjectTeacher
from employeeform.models import Teacher
from classform.models import ClassRoom
from django.contrib import messages

# Create your views here.


def add_detail(request):
    class_room = request.GET.get("class_room")
    teacher_empID = request.GET.get("teacher_empID")
    subjects = request.GET.get("subject")
    if teacher_empID and class_room:
        ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
            employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
       	if "subject1" in request.GET:
            subjects = request.GET.get("subject1")
            ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
                employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
        if "subject2" in request.GET:
            subjects = request.GET.get("subject2")
            ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
                employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
        if "subject3" in request.GET:
            subjects = request.GET.get("subject3")
            ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
                employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
        if "subject4" in request.GET:
            subjects = request.GET.get("subject4")
            ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
                employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
        if "subject5" in request.GET:
            subjects = request.GET.get("subject5")
            ClassRoomSubjectTeacher.objects.create(teacher=Teacher.objects.get(
                employee__empID=teacher_empID), class_room=ClassRoom.objects.get(classSection=class_room), subjects=subjects)
        messages.success(request, "Successfully Added detail!")
    return render(request, 'timetable/addDetail.html', {"class_rooms": ClassRoom.objects.all(), "teachers": Teacher.objects.all()})


def view_details(request):
    class_room_subject_teachers = ClassRoomSubjectTeacher.objects.all()
    return render(request, 'timetable/detailsList.html', {"class_room_subject_teachers": class_room_subject_teachers})
