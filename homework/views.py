from django.shortcuts import render, redirect
from classform.models import ClassRoom
from matplotlib import pyplot as plt
import numpy as np
import matplotlib
from markssection.models import ExamMapping
from .models import HomeWork
from datetime import datetime
matplotlib.use('TkAgg')
plt.style.use("fivethirtyeight")
# Create your views here.


def homework_home(request):
    subjects = (ExamMapping.objects.all().values('subject').distinct())
    context = {
        "class_rooms": ClassRoom.objects.all(),
        "subjects": subjects
    }
    if request.method == "POST":
        print(request.FILES)
        print(request.POST)
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
    if request.method == "POST":
        print(request.FILES)
        print(request.POST)
        class_section = request.POST.get("class_room")
        description = request.POST.get("description")
        document = request.FILES.get("syllabus_file")
        HomeWork.objects.create(classRoom=ClassRoom.objects.get(classSection=class_section), description=description,
                                date_published=datetime.today(), document=document)
    return render(request, 'homework/syllabus.html', {'class_rooms': ClassRoom.objects.all()})
