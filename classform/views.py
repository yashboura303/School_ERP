"""
  Handle class registration part
"""
from django.contrib import messages
from django.shortcuts import render, redirect

from employeeform.models import Teacher
from .models import ClassRoom


def addclass(request):
    """ 
    Add new Class with teacher name
    input: teacher name and class name
    """
    if request.method == "POST":
        class_section = request.POST["classSection"]
        teacher = request.POST["teacher"]
        _teacher = Teacher.objects.get(fullName__exact=teacher)
        classroom = ClassRoom.objects.create(teacher=_teacher, classSection=class_section)
        classroom.save()
        messages.success(request, "Class alloted!")
        return redirect('addClass')

    return render(request, 'classform/addclass.html')
