"""
Attendence app handling
"""
from datetime import date, datetime
import matplotlib
from matplotlib import pyplot as plt
from django.shortcuts import render, redirect
from django.contrib import messages
from employeeform.models import Teacher
from classform.models import ClassRoomStudent, ClassRoom
from .models import StudentAttendence, TeacherAttendence




matplotlib.use('TkAgg')


def student_attendence(request):
    """
    Handling student attendence
    Input: Admission Number or Class-Section
    Ouptut: List of students
    """

    # FOR DISPLAYING STUDENTS
    classrooms = ClassRoom.objects.all()
    if request.method == "GET":
        if "add_no" in request.GET:
            add_no = request.GET["add_no"]
            students = ClassRoomStudent.objects.filter(
                student__admissionNumber__icontains=add_no)
        if "class_name" in request.GET:
            class_name = request.GET["class_name"]
            request.session["class_name"] = class_name
            students = students.filter(
                classRoom__classSection__icontains=class_name)
            return render(request, 'attendence/student.html', {"students": students, 'class_rooms':classrooms})

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

            for classroomstudent in classstudents:

                if str(classroomstudent.student.admissionNumber) in request.POST:
                    print(classroomstudent)
                    s = StudentAttendence.objects.create(student=classroomstudent, date=_date, status=request.POST[str(
                        classroomstudent.student.admissionNumber)])
                    s.save()

    return render(request, 'attendence/student.html', {'class_rooms':classrooms})


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
        plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
        plt.title(f"Attendence for {name}")
        plt.tight_layout()
        fig = plt.figure()
        plt.show()

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
        if "year" in request.POST:
            _year = request.POST["year"]
            teacher_attendence = TeacherAttendence.objects.filter(
                date__year=_year)
        if "month" in request.POST:
            _month = request.POST["month"]
            teacher_attendence = teacher_attendence.filter(date__month=_month)
        if "emp_id_no" in request.POST:
            emp_id_no = request.POST["emp_id_no"]
            teacher_attendence = teacher_attendence.filter(
                teacher__employee__empID=emp_id_no)
        for teacher in teacher_attendence:
            name = teacher.teacher.fullName
            if teacher.status == "present":
                present += 1
            else:
                absent += 1
        slices = [present, absent]
        plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
        plt.title(f"Attendence for {name}")
        plt.tight_layout()
        fig = plt.figure()
        plt.show()
        redirect('piechartTeacher')

    return render(request, 'attendence/teacherPieChart.html')
