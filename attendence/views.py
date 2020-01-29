"""
Attendence app handling
"""
import io
import urllib
import base64
from datetime import date, datetime
import matplotlib
from matplotlib import pyplot as plt
from django.shortcuts import render, redirect
from django.contrib import messages
from accounts.models import UserProfile
from employeeform.models import Teacher, Employee
from classform.models import ClassRoomStudent, ClassRoom
from .models import StudentAttendence, TeacherAttendence
from accounts.models import UserProfile


matplotlib.use('Agg')


def student_attendence(request):
    """
    Handling student attendence
    Input: Admission Number or Class-Section
    Ouptut: List of students
    """

    # FOR DISPLAYING STUDENTS
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Teacher":
        emp_id = user_profile.emp_id
        employee = Employee.objects.get(empID=emp_id)
        teacher = Teacher.objects.get(employee=employee)
        class_section = teacher.classTeacher
        classrooms = ClassRoom.objects.filter(classSection=class_section)
    else:
        classrooms = ClassRoom.objects.all()
    students = False
    if request.method == "GET":
        if "add_no" in request.GET:
            add_no = request.GET["add_no"]
            if add_no:
                students = ClassRoomStudent.objects.filter(
                    student__admissionNumber=add_no)
                request.session["add_no"] = add_no
            else:
                students = ClassRoomStudent.objects.all()
        if "class_room" in request.GET:
            class_name = request.GET["class_room"]
            if class_name:
                students = students.filter(
                    classRoom__classSection__icontains=class_name)
                request.session["class_name"] = class_name
        if students:
            return render(request, 'attendence/student.html', {"students": students, 'class_rooms': classrooms})

    # FOR MARKING ATTENDENCE
    if request.method == "POST":
        if "date" in request.POST:
            _date = request.POST["date"]
            _date = date(*map(int, _date.split('-')))
            if _date.weekday() == 6:
                messages.info(request, "Selected Date is a holiday!")
                redirect('attendenceStudent')
            classstudents = ClassRoomStudent.objects.filter(
                classRoom__classSection__icontains=request.session["class_name"])
            if "add_no" in request.session:
                classstudents = ClassRoomStudent.objects.filter(
                    student__admissionNumber=request.session["add_no"])

            for classroomstudent in classstudents:
                if str(classroomstudent.student.admissionNumber) in request.POST:
                    s = StudentAttendence.objects.create(student=classroomstudent, date=_date, status=request.POST[str(
                        classroomstudent.student.admissionNumber)])
                    s.save()

    return render(request, 'attendence/student.html', {'class_rooms': classrooms})


def student_pie_chart(request):
    """
    Pie Chart using matplotlib
    Input: Month and Year for data required
    Output: Pie Chart 
    """
    plt.style.use("fivethirtyeight")
    present = 0
    absent = 0
    labels = ['Present', 'Absent']
    if request.method == "POST":
        if "year" in request.POST:
            _year = request.POST["year"]
            student_attendence = StudentAttendence.objects.filter(
                date__year=_year)
        if "month" in request.POST:
            _month = request.POST["month"]
            student_attendence = student_attendence.filter(date__month=_month)
        user_profile = UserProfile.objects.get(user=request.user)
        if user_profile.user_type == "Student":
            add_no = user_profile.addmission_number
        else:
            if "add_no" in request.POST:
                add_no = request.POST["add_no"]
        student_attendence = student_attendence.filter(
            student__student__admissionNumber=add_no)
        for student in student_attendence:
            name = student.student.student.fullName
            if student.status == "present":
                present += 1
            else:
                absent += 1
        slices = [present, absent]
        plt.clf()
        plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
        plt.title(f"Attendence Report")
        plt.tight_layout()
        fig3 = plt.gcf()
        buf3 = io.BytesIO()
        fig3.savefig(buf3, format='png')
        buf3.seek(0)
        string = base64.b64encode(buf3.read())
        uri = 'data:image/png;base64,' + urllib.parse.quote(string)
        return render(request, 'attendence/studentPieChart.html', {'image': uri})
    return render(request, 'attendence/studentPieChart.html')


def teacher_attendence(request):
    """
    Handling teacher attendence
    Input: EmpID Number or Teacher Name
    Ouptut: List of Teachers
    """
    # FOR DISPLAYING TEACHERS
    if request.method == "GET":
        if "emp_id" in request.GET:
            emp_id = request.GET["emp_id"]
            request.session["emp_id"] = emp_id
            teachers = Teacher.objects.filter(
                employee__empID__icontains=emp_id)
        if "teacher_name" in request.GET:
            teacher_name = request.GET["teacher_name"]
            request.session["teacher_name"] = teacher_name
            teachers = teachers.filter(fullName__icontains=teacher_name)
            return render(request, 'attendence/teacher.html', {"teachers": teachers})

    # FOR MARKING ATTENDENCE
    if request.method == "POST":
        teachers = Teacher.objects.filter(
            fullName__icontains=request.session["teacher_name"])
        teachers = teachers.filter(
            employee__empID__icontains=request.session["emp_id"])

        if "date" in request.POST:
            _date = request.POST["date"]
            _date = date(*map(int, _date.split('-')))
            for teacher in teachers:

                if str(teacher.employee.empID) in request.POST:
                    print(teacher)
                    s = TeacherAttendence.objects.create(
                        teacher=teacher, date=_date, status=request.POST[str(teacher.employee.empID)])
                    if str(teacher.employee.empID) == "present":
                        s.total_no_of_days_present += 1
                    s.save()

    return render(request, 'attendence/teacher.html')


def teacher_pie_chart(request):
    """
    Pie Chart using matplotlib
    Input: Month and Year for data required
    Output: Pie Chart 
    """
    plt.style.use("fivethirtyeight")
    present = 0
    absent = 0
    labels = ['Present', 'Absent']
    if request.method == "POST":
        _year = request.POST.get("year")
        teacher_attendence = TeacherAttendence.objects.filter(
            date__year=_year)
        _month = request.POST.get("month")
        teacher_attendence = teacher_attendence.filter(date__month=_month)
        user_profile = UserProfile.objects.get(user=request.user)
        if user_profile.user_type == "Teacher":
            emp_id_no = user_profile.emp_id
        else:
            emp_id_no = request.POST.get("emp_id_no")
        teacher_attendence = teacher_attendence.filter(
            teacher__employee__empID=emp_id_no)
        for teacher in teacher_attendence:
            name = teacher.teacher.fullName
            if teacher.status == "present":
                present += 1
            else:
                absent += 1
        slices = [present, absent]
        # plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
        # plt.title(f"Attendence for {name}")
        # plt.tight_layout()
        # fig = plt.figure()
        # plt.show()
        # redirect('piechartTeacher')
        plt.clf()
        plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
        plt.title(f"Attendence Report")
        plt.tight_layout()
        fig3 = plt.gcf()
        buf3 = io.BytesIO()
        fig3.savefig(buf3, format='png')
        buf3.seek(0)
        string = base64.b64encode(buf3.read())
        uri = 'data:image/png;base64,' + urllib.parse.quote(string)
        return render(request, 'attendence/teacherPieChart.html', {'image': uri})


    return render(request, 'attendence/teacherPieChart.html')
