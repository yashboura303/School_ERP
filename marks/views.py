from django.shortcuts import render, redirect
from .models import ExamType, SubjectsToClass
from classform.models import ClassRoom, ClassRoomStudent
from django.http import HttpResponse
from django.contrib import messages

from django.http import JsonResponse
# Create your views here.
def home(request):
    return render(request, 'marks/home.html')


def add_exam_form(request):
    if request.method == "POST":
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]
        if "total_marks" in request.POST:
            total_marks = request.POST["total_marks"]

        ExamType.objects.create(examType=exam_type, totalMarks=total_marks)

        return HttpResponse('')

def add_subject_form(request):
    if request.method == "POST":
        if "class_room" in request.POST:
            class_room = request.POST["class_room"]
        if "class_subject" in request.POST:
            class_subject = request.POST["class_subject"]

        _class = ClassRoom.objects.get(classSection__exact=class_room)

        if SubjectsToClass.objects.filter(classroom__exact=_class):
            s = SubjectsToClass.objects.get(classroom=_class)
            s.subjects += ","+class_subject
            s.save()
            return HttpResponse('')

        SubjectsToClass.objects.create(classroom=_class, subjects=class_subject)

        return HttpResponse('')

def add_marks(request):
    if request.method == "GET":
        class_name = request.GET["class_name"]
        exam_type = request.GET["exam_type"]
        subject = request.GET["subject"]   


        students = ClassRoomStudent.objects.filter(classRoom__classSection__icontains = class_name)
        return render(request, 'marks/addMarks.html',{"students":students,"values":request.GET})
    return render(request, 'marks/addMarks.html')