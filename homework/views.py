from django.shortcuts import render, redirect
from classform.models import ClassRoom
from accounts.models import UserProfile
from classform.models import ClassRoomStudent
from employeeform.models import Employee, Teacher
from matplotlib import pyplot as plt
import numpy as np
import matplotlib
from markssection.models import ExamMapping
from .models import HomeWork, Syllabus
from datetime import datetime
matplotlib.use('Agg')
plt.style.use("fivethirtyeight")
# Create your views here.


def homework_home(request):
    subjects = (ExamMapping.objects.all().values('subject').distinct())
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Teacher":
        emp_id = user_profile.emp_id
        employee = Employee.objects.get(empID=emp_id)
        teacher = Teacher.objects.get(employee=employee)
        class_section=teacher.classTeacher
        qs1 = ClassRoom.objects.filter(classroomsubjectteacher__teacher=teacher)
        qs2 = ClassRoom.objects.filter(classSection=class_section)
        class_rooms = qs1.union(qs2)
        context = {
        "class_rooms": class_rooms,
        "subjects":subjects
        }
    else:
        context = {
            "class_rooms": ClassRoom.objects.all(),
        "subjects":subjects
        }
    if request.method == "POST":
        class_section = request.POST.get("class_room")
        subject = request.POST.get("subject")
        description = request.POST.get("detail")
        document = request.FILES.get("homeworkFile")
        HomeWork.objects.create(classRoom=ClassRoom.objects.get(classSection=class_section), subject=subject, description=description,
                                date_published=datetime.today(), document=document)

    return render(request, 'homework/addHomework.html', context)


def check_homework(request):
    context = {
        "class_rooms": ClassRoom.objects.all(),
    }
    if request.method == "POST":
        class_section = request.POST.get("class_room")

        homeworks = HomeWork.objects.filter(
            classRoom=ClassRoom.objects.get(classSection=class_section))
        subjects = (ExamMapping.objects.all().values('subject').distinct())
        subjects_in_homework = []
        for homework in homeworks:
            sub = homework.subject
            if sub not in subjects_in_homework:
                subjects_in_homework.append(sub)

        y_axis = [1]*len(subjects_in_homework)
        print(subjects_in_homework)
        width = 0.1
        # y_axis = [1,1]
        subject_x = np.arange(1)
        print(len(subjects_in_homework))
        print("subject_x", subject_x)
        print("y_axis", y_axis)
        color = ["#444444", "#008fd5", "#349912",
                 "#876543", "#642111", "#076666"]
        for i in range(len(subjects_in_homework)):
            plt.bar(subject_x + width*i, y_axis, color=color[i], align='edge',
                    label=subjects_in_homework[i], width=width-0.02)
        # plt.xticks(subject_x, subjects_in_homework)
        plt.xticks([])

        # plt.bar(subject_x, y_axis, color="#444444",
        #         label="Mathematics", width=width)
        # plt.bar(subject_x+0.05+width, y_axis, color="#008fd5",
        #         label="English", width=width)
        plt.legend()
        plt.title(f"Chart for {class_section}")
        plt.xlabel("Subjects")
        # plt.ylabel("Marks")
        plt.tight_layout()
        plt.show()
        redirect('checkHomework')

    return render(request, 'homework/checkHomework.html', context)


def syllabus(request):
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Teacher":
        emp_id = user_profile.emp_id
        employee = Employee.objects.get(empID=emp_id)
        teacher = Teacher.objects.get(employee=employee)
        class_section=teacher.classTeacher
        qs1 = ClassRoom.objects.filter(classroomsubjectteacher__teacher=teacher)
        qs2 = ClassRoom.objects.filter(classSection=class_section)
        class_rooms = qs1.union(qs2)
        context = {
        "class_rooms": class_rooms
        }
    else:
        context = {
            "class_rooms": ClassRoom.objects.all()
        }
    if request.method == "POST":
        class_section = request.POST.get("class_room")
        description = request.POST.get("description")
        document = request.FILES.get("syllabus_file")
        Syllabus.objects.create(classRoom=ClassRoom.objects.get(classSection=class_section), description=description,
                                date_published=datetime.today(), document=document)
    return render(request, 'homework/syllabus.html', context)


def check_class_homework(request):
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Student":
        addmission_number = user_profile.addmission_number
        student = ClassRoomStudent.objects.get(student__admissionNumber=addmission_number)
        class_room = student.classRoom
        homeworks = HomeWork.objects.filter(classRoom=class_room)
        if len(homeworks) > 0:
            return render(request, 'homework/studentClassHomework.html', {"homeworks":homeworks})
        else:
            return render(request, 'homework/studentClassHomework.html')

def check_class_syllabus(request):
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Student":
        addmission_number = user_profile.addmission_number
        student = ClassRoomStudent.objects.get(student__admissionNumber=addmission_number)
        class_room = student.classRoom
        syllabuss = Syllabus.objects.filter(classRoom=class_room)
        if len(syllabuss) > 0:
            return render(request, 'homework/checkSyllabus.html', {"syllabuss":syllabuss})
        else:
            return render(request, 'homework/checkSyllabus.html')