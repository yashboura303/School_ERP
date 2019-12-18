from django.shortcuts import render, redirect
from django.contrib import messages
from classform.models import ClassRoom, ClassRoomStudent
from .models import ClassNotice, StudentNotice
# Create your views here.


def notice_home(request):
    context = {
        "class_rooms": ClassRoom.objects.all()
    }
    if request.method == "POST":
        class_section = request.POST.get("class_room")
        notice = request.POST.get("notice")
        document = request.FILES.get("noticeFile")
        ClassNotice.objects.create(classRoom=ClassRoom.objects.get(
            classSection=class_section), notice=notice, notice_document=document)
    return render(request, 'notice/noticeHome.html', context)


def search_student(request):
    students = ClassRoomStudent.objects.all()
    if request.method == "GET":
        print(request.GET)
        if "name" in request.GET:
            name = request.GET["name"]
            students = students.filter(student__fullName__icontains=name)
        if "addNumber" in request.GET:
            add_no = request.GET.get("addNumber")
            students = students.filter(
                student__admissionNumber__icontains=(add_no))
            if students:
                return render(request, 'notice/searchStudent.html', {"students": students, "values": request.GET})
            else:
                messages.error(
                    request, 'Cant find student with entered detail')
                return redirect('searchStudent')
    return render(request, 'notice/searchStudent.html')


def notice__student(request, pk):
    student = ClassRoomStudent.objects.get(student__admissionNumber=(pk))
    if request.method == "POST":
        notice = request.POST.get("notice")
        document = request.FILES.get("noticeFile")
        StudentNotice.objects.create(
            student=student, notice=notice, notice_document=document)
    return render(request, 'notice/noticeStudent.html', {"student": student})
