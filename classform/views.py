"""
  Handle class registration part
"""
from django.contrib import messages
from django.shortcuts import render, redirect

from employeeform.models import Teacher
from .models import ClassRoom


def addclass(request):
    """ 
    Add new Class with teacher 
    input: teacher name and class name
    """
    teachers = Teacher.objects.all()
    if request.method == "POST":
        print(request.POST)
        class_section = request.POST.get("classSection")
        teacher_empID = request.POST.get("teacher")
        if teacher_empID:
          _teacher = Teacher.objects.get(employee__empID=teacher_empID)
          classroom = ClassRoom.objects.create(teacher=_teacher, classSection=class_section)
        else:
          classroom = ClassRoom.objects.create(classSection=class_section)
        classroom.save()
        messages.success(request, "Class alloted!")
        return redirect('addClass')

    return render(request, 'classform/addclass.html', {"teachers":teachers})
