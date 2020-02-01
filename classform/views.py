"""
  Handle class registration part
"""
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib import messages
from employeeform.models import Teacher
from .models import ClassRoom


def addclass(request):
    """ 
    Add new Class with teacher 
    input: teacher name and class name
    """
    if request.method == "POST":
        print(request.POST)
        _class = request.POST.get("class")
        _section = request.POST.get("section")
        room_no = request.POST.get("room_no")
        class_section = _class + "-" + _section
        class_rooms = ClassRoom.objects.filter(classSection=class_section)
        if len(class_rooms) > 0:
          messages.info(request, "Class already alloted")
          redirect('addclass')
        classroom = ClassRoom.objects.create(classSection=class_section, _class=_class, _section=_section, room_no=room_no)
        classroom.save()
        messages.success(request, "Class alloted!")
        return redirect('addClass')

    return render(request, 'classform/addclass.html')
