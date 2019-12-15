from django.shortcuts import render, redirect
from .models import ExamType, Exam, ExamMapping, Marks, AdditionalSubjectMapping
from classform.models import ClassRoom, ClassRoomStudent
from django.http import HttpResponse
from django.contrib import messages

from django.http import JsonResponse


def home(request):
    context = {

        "class_rooms": ClassRoom.objects.all(),
        "exam_types": ExamType.objects.all(),
        "exam_names": Exam.objects.all()
    }
    return render(request, 'marks/home.html', context)


def add_exam_form(request):
    if request.method == "POST":
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "description" in request.POST:
            description = request.POST["description"]

        Exam.objects.create(examName=exam_name, description=description)

        return HttpResponse('')


def exam_type_form(request):
    if request.method == "POST":
        if "min_marks" in request.POST:
            min_marks = request.POST["min_marks"]
        if "max_marks" in request.POST:
            max_marks = request.POST["max_marks"]
        if "priority" in request.POST:
            priority = request.POST["priority"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]

        ExamType.objects.create(minMarks=min_marks, maxMarks=max_marks,
                                examName=Exam.objects.get(examName=exam_name), examType=exam_type, priority=priority)

        return HttpResponse('')


def exam_mapping(request):
    if request.method == "POST":
        if "class_subject" in request.POST:
            class_subject = request.POST["class_subject"]
        if "class_room" in request.POST:
            class_room = request.POST["class_room"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]

        ExamMapping.objects.create(subject=class_subject,
                                   classroom=ClassRoom.objects.get(
                                       classSection=class_room),
                                   examName=Exam.objects.get(
                                       examName=exam_name),
                                   examType=ExamType.objects.get(examType=exam_type))
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

        SubjectsToClass.objects.create(
            classroom=_class, subjects=class_subject)

        return HttpResponse('')


def add_marks(request):

    exam_types = ExamType.objects.all()
    exam_names = Exam.objects.all()
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
        if "exam_name" in request.GET:
            exam_name = request.GET["exam_name"]
            print("sssss", exam_name)
            request.session["exam_name"] = exam_name
            try:
                students = ClassRoomStudent.objects.filter(
                    classRoom__classSection__icontains=class_name)
                return render(request, 'marks/addMarks.html', {"students": students,
                                                               "values": request.GET, "exam_types": exam_types,
                                                               "class_rooms": class_rooms, "exam_names": exam_names})
            except:
                messages.error(request, "Class doesn't exist")
                redirect('addMarks')

    if request.method == "POST":
        try:
            classstudents = ClassRoomStudent.objects.filter(
                classRoom__classSection__exact=request.session["class_name"])
            exam_type = ExamType.objects.get(
                examType=request.session["exam_type"])
            exam_name = Exam.objects.get(
                examName=request.session["exam_name"])
            for classroomstudent in classstudents:
                student_marks = Marks.objects.create(classroomStudent=classroomstudent,
                                                     examType=exam_type,
                                                     examName=exam_name,
                                                     marks=request.POST[str(
                                                         classroomstudent.student.admissionNumber)],
                                                     subject=request.session["subject"])
        except:
            messages.error(request, "Please enter correct info")
            redirect('addMarks')

    return render(request, 'marks/addMarks.html', {"exam_types": exam_types,
                                                   "class_rooms": class_rooms, "values": request.GET, "exam_names": exam_names})


def additional_sub_mapping(request):
    if request.method == "POST":
        print(request.POST)
        if "add_number" in request.POST:
            add_number = request.POST["add_number"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]
        if "subject" in request.POST:
            subject = request.POST["subject"]
        if "marks" in request.POST:
            marks = request.POST["marks"]

        _student = ClassRoomStudent.objects.get(
            student__admissionNumber=add_number)
        print("sssssss", exam_name)
        print("sssssss", exam_type)
        exam_name = Exam.objects.get(examName=exam_name)
        print(9999999)
        exam_type = ExamType.objects.get(examType=exam_type)
        AdditionalSubjectMapping.objects.create(examName=exam_name,
                                                examType=exam_type,
                                                classroomStudent=_student,
                                                marks=marks,
                                                subject=subject)

        return HttpResponse('')


def report_card(request, pk):
    class_room_student = ClassRoomStudent.objects.get(student__admissionNumber=pk)
    marks = Marks.objects.filter(classroomStudent=class_room_student)
    