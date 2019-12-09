"""
Attendence app handling
"""

from django.shortcuts import render
from form.models import StudentInfo
from classform.models import ClassRoomStudent
from employeeform.models import Teacher

# Create your views here.
def student_attendence(request):
    if request.method == "POST":
        add_no = request.POST["add_no"]
        students = ClassRoomStudent.objects.filter(student__admissionNumber__icontains=add_no)
        return render(request, 'attendence/student.html', {"students":students})
    return render(request,'attendence/student.html')


def teacher_attendence(request):
    return render(request, 'attendence/teacher.html')
    