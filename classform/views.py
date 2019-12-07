from django.shortcuts import render,redirect
from employeeform.models import Teacher
from .models import ClassRoom,ClassRoomStudent
from django.contrib import messages


def addClass(request):
    if request.method == "POST":
        classSection = request.POST["classSection"]
        teacher = request.POST["teacher"]
        _teacher = Teacher.objects.get(fullName__exact = teacher)
        classroom = ClassRoom.objects.create(teacher = _teacher, classSection=classSection)
        classroom.save()
        messages.success(request,"Class alloted!")
        return redirect('addClass')

    return render(request, 'classform/addclass.html')