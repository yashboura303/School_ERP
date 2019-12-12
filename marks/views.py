from django.shortcuts import render, redirect
from .models import ExamType, SubjectsToClass, Marks
from classform.models import ClassRoom, ClassRoomStudent
from django.http import HttpResponse
from django.contrib import messages

from django.http import JsonResponse
# Create your views here.
def home(request):
    return render(request, 'marks/home.html',{"class_rooms":ClassRoom.objects.all()})


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

    exam_types = ExamType.objects.all()
    class_rooms = ClassRoom.objects.all()

    if request.method == "GET":
        if "class_name" in request.GET:
            class_name = request.GET["class_name"]
            request.session["class_name"] = class_name
        if "exam_type" in request.GET:
            exam_type = request.GET["exam_type"]
            request.session["exam_type"] = exam_type
        if "subject" in request.GET:
            subject = request.GET["subject"]   
            request.session["subject"] = subject     
            try:
                students = ClassRoomStudent.objects.filter(classRoom__classSection__icontains = class_name)
                return render(request, 'marks/addMarks.html',{"students":students,"values":request.GET, "exam_types":exam_types,"class_rooms":class_rooms})
            except:
                messages.error(request, "Class doesn't exist")
                redirect('addMarks')

    if request.method == "POST":
        try:
            classstudents = ClassRoomStudent.objects.filter(
                    classRoom__classSection__exact=request.session["class_name"])
            exam_type = ExamType.objects.get(examType=request.session["exam_type"])
            for classroomstudent in classstudents:
                student_marks = Marks.objects.create(classroomStudent=classroomstudent, 
                    examType= exam_type,
                    marks=request.POST[str(classroomstudent.student.admissionNumber)],
                    subject= request.session["subject"])
        except:
            messages.error(request, "Please enter correct info")
            redirect('addMarks')

    return render(request, 'marks/addMarks.html',{"exam_types":exam_types,"class_rooms":class_rooms})