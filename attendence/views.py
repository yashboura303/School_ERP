"""
Attendence app handling
"""

from django.shortcuts import render
from form.models import StudentInfo
from classform.models import ClassRoomStudent, ClassRoom
from employeeform.models import Teacher

# Create your views here.
def student_attendence(request):
    if request.method == "GET":
        if "add_no" in request.GET:
            add_no = request.GET["add_no"]
            students = ClassRoomStudent.objects.filter(student__admissionNumber__icontains=add_no)
        if "class_name" in request.GET:
            class_name = request.GET["class_name"]
            students = students.filter(classRoom__classSection__icontains = class_name)
            return render(request, 'attendence/student.html', {"students":students})
    return render(request,'attendence/student.html')


def teacher_attendence(request):
    return render(request, 'attendence/teacher.html')
    