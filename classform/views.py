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
        if _teacher:
          try:
            classroom = ClassRoom.objects.create(teacher=_teacher, classSection=class_section)
          except:
            messages.error(request, "Class already alloted!")
            return redirect('addClass')
          classroom.save()
          messages.success(request, "Class alloted!")
          return redirect('addClass')
        messages.error(request,"Teahcer name not registered")
        return redirect('addClass')

    return render(request, 'classform/addclass.html')
