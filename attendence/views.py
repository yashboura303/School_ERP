"""
Attendence app handling
"""
from datetime import date
from django.shortcuts import render
from form.models import StudentInfo
from classform.models import ClassRoomStudent, ClassRoom
from employeeform.models import Teacher
from .models import StudentAttendence, TeacherAttendence

# Create your views here.
def student_attendence(request):
    if request.method == "GET":
        if "add_no" in request.GET:
            add_no = request.GET["add_no"]
            students = ClassRoomStudent.objects.filter(student__admissionNumber__icontains=add_no)
        if "class_name" in request.GET:
            class_name = request.GET["class_name"]
            request.session["class_name"] = class_name
            students = students.filter(classRoom__classSection__icontains = class_name)
            return render(request, 'attendence/student.html', {"students":students})
    

    if request.method == "POST":
        classstudents = ClassRoomStudent.objects.filter(classRoom__classSection__icontains = request.session["class_name"])
        
        if "date" in request.POST:
            _date = request.POST["date"]
            _date = date(*map(int, _date.split('-')))
            for classroomstudent in classstudents:
                
                if str(classroomstudent.student.admissionNumber) in request.POST: 
                    print(classroomstudent)
                    s=StudentAttendence.objects.create(student=classroomstudent, date=_date, status=request.POST[str(classroomstudent.student.admissionNumber)])
                    s.save()

    return render(request,'attendence/student.html')

def teacher_attendence(request):
    return render(request, 'attendence/teacher.html')
    