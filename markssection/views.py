import matplotlib
import numpy as np
from matplotlib import pyplot as plt
from django.shortcuts import render, redirect
from .models import ExamType, Exam, ExamMapping, Marks, AdditionalSubjectMapping
from classform.models import ClassRoom, ClassRoomStudent
from django.http import HttpResponse
from django.contrib import messages

from django.http import JsonResponse

matplotlib.use('TkAgg')


def home(request):
    """
    Main page for marks section
    """
    context = {

        "class_rooms": ClassRoom.objects.all(),
        "exam_types": ExamType.objects.all(),
        "exam_names": Exam.objects.all()
    }
    return render(request, 'marks/home.html', context)


def add_exam_form(request):
    """
    Add exams for eg. UT-1, SA-1.
    Input: Exam Name and Description
    """
    if request.method == "POST":
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "description" in request.POST:
            description = request.POST["description"]

        Exam.objects.create(examName=exam_name, description=description)

        return HttpResponse('')


def exam_type_form(request):
    """
    Add Exam Type like Oral , Practical, Theory
    Input: Exam Name, Exam Type Name, Min/Max Marks, Priority
    """
    if request.method == "POST":
        if "min_marks" in request.POST:
            min_marks = request.POST["min_marks"]
        if "max_marks" in request.POST:
            max_marks = request.POST["max_marks"]
        if "priority" in request.POST:
            priority = request.POST["priority"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]

        ExamType.objects.create(minMarks=min_marks, maxMarks=max_marks,
                                examName=Exam.objects.get(examName=exam_name), examType=exam_type, priority=priority)

        return HttpResponse('')


def exam_mapping(request):
    """
    Map exam type with Exam Name eg. SA-1 mapped with Theory
    Input: Subject, ClassRoom, Exam Name & Type
    """
    if request.method == "POST":
        if "class_subject" in request.POST:
            class_subject = request.POST["class_subject"]
        if "class_room" in request.POST:
            class_room = request.POST["class_room"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]

        ExamMapping.objects.create(subject=class_subject,
                                   classroom=ClassRoom.objects.get(
                                       classSection=class_room),
                                   examName=Exam.objects.get(
                                       examName=exam_name),
                                   examType=ExamType.objects.get(examType=exam_type))
        return HttpResponse('')


def add_marks(request):
    """
    Register marks for students 
    Input: ClassName, Exam Type and Exam Name, Subject
    Output: A list of students in a classroom and multiple input field for entering marks
    """
    exam_types = ExamType.objects.all()
    exam_names = Exam.objects.all()
    class_rooms = ClassRoom.objects.all()

    if request.method == "GET":

        if "class_name" in request.GET:
            class_name = request.GET["class_name"]
            request.session["class_name"] = class_name
        if "exam_type" in request.GET:
            exam_type = request.GET["exam_type"]
            request.session["exam_type"] = exam_type
        if "subject" in request.GET:
            subject = request.GET["subject"]
            request.session["subject"] = subject
        if "exam_name" in request.GET:
            exam_name = request.GET["exam_name"]
            print("sssss", exam_name)
            request.session["exam_name"] = exam_name
            try:
                students = ClassRoomStudent.objects.filter(
                    classRoom__classSection__icontains=class_name)
                return render(request, 'marks/addMarks.html', {"students": students,
                                                               "values": request.GET, "exam_types": exam_types,
                                                               "class_rooms": class_rooms, "exam_names": exam_names})
            except:
                messages.error(request, "Class doesn't exist")
                redirect('addMarks')

    if request.method == "POST":
        try:
            classstudents = ClassRoomStudent.objects.filter(
                classRoom__classSection__exact=request.session["class_name"])
            exam_type = ExamType.objects.get(
                examType=request.session["exam_type"])
            exam_name = Exam.objects.get(
                examName=request.session["exam_name"])
            for classroomstudent in classstudents:
                student_marks = Marks.objects.create(classroomStudent=classroomstudent,
                                                     examType=exam_type,
                                                     examName=exam_name,
                                                     marks=request.POST[str(
                                                         classroomstudent.student.admissionNumber)],
                                                     subject=request.session["subject"])
        except:
            messages.error(request, "Please enter correct info")
            redirect('addMarks')

    return render(request, 'marks/addMarks.html', {"exam_types": exam_types,
                                                   "class_rooms": class_rooms, "values": request.GET, "exam_names": exam_names})


def additional_sub_mapping(request):
    """
    Add additional subject for each student "
    Input: Admission Number, Exam Name and Type, Subject Name, Marks
    """
    if request.method == "POST":
        print(request.POST)
        if "add_number" in request.POST:
            add_number = request.POST["add_number"]
        if "exam_name" in request.POST:
            exam_name = request.POST["exam_name"]
        if "exam_type" in request.POST:
            exam_type = request.POST["exam_type"]
        if "subject" in request.POST:
            subject = request.POST["subject"]
        if "marks" in request.POST:
            marks = request.POST["marks"]

        _student = ClassRoomStudent.objects.get(
            student__admissionNumber=add_number)
        exam_name = Exam.objects.get(examName=exam_name)
        exam_type = ExamType.objects.get(examType=exam_type)
        AdditionalSubjectMapping.objects.create(examName=exam_name,
                                                examType=exam_type,
                                                classroomStudent=_student,
                                                marks=marks,
                                                subject=subject)

        return HttpResponse('')


def report_card(request, pk):
    class_room_student = ClassRoomStudent.objects.get(
        student__admissionNumber=pk)
    marks = Marks.objects.filter(classroomStudent=class_room_student)


def report_analysis(request):
    """
    Generate graph for SA's and UT's for a given student
    Input: Student's Admission Number
    Output: Bar graph for a given term or combined term with all UT's and SA's
    """
    if request.method == 'GET':
        plt.style.use("fivethirtyeight")
        if "add_number" in request.GET:
            add_number = request.GET["add_number"]
        if "term" in request.GET:
            term = request.GET.getlist('term')
            class_student = ClassRoomStudent.objects.get(
                student__admissionNumber=add_number)
            class_section = class_student.classRoom.classSection
            class_room = ClassRoom.objects.get(classSection=class_section)
            subject_x = []

            # get subjects list for a particular classroom
            exam_mapping = ExamMapping.objects.filter(classroom=class_room)
            for a in exam_mapping:
                if a.subject not in subject_x:
                    subject_x.append(a.subject)
            subject_x.sort()

            # Get UT and SA marks according to term 1 or term 2
            try:
                if 'term1' in term and 'term2' not in term:
                    marks = Marks.objects.filter(
                        examName__examName='UT-1', classroomStudent=class_student)
                    ut1_y = []
                    for subject in subject_x:
                        ut1_y.append(marks.get(subject=subject).marks)

                    sa_1_y = []
                    marks = Marks.objects.filter(
                        examName__examName='SA-1', classroomStudent=class_student)
                    for subject in subject_x:
                        sa_1_y.append(marks.get(subject=subject).marks)

                    width = 0.25
                    subjects = subject_x
                    subject_x = np.arange(len(subject_x))
                    plt.xticks(subject_x, subjects)

                    plt.bar(subject_x-width, ut1_y, color="#444444",
                            label="UT-1", width=width)
                    plt.bar(subject_x, sa_1_y, color="#008fd5",
                            label="SA-1", width=width)
                    plt.legend()
                    plt.title("Marks of Term 1")
                    plt.xlabel("Subjects")
                    plt.ylabel("Marks")
                    plt.tight_layout()
                    plt.show()

                elif 'term2' in term and 'term1' not in term:
                    marks = Marks.objects.filter(
                        examName__examName='UT-2', classroomStudent=class_student)
                    ut2_y = []
                    for subject in subject_x:
                        ut2_y.append(marks.get(subject=subject).marks)

                    sa_2_y = []
                    marks = Marks.objects.filter(
                        examName__examName='SA-2', classroomStudent=class_student)
                    for subject in subject_x:
                        sa_2_y.append(marks.get(subject=subject).marks)

                    width = 0.25
                    subjects = subject_x
                    subject_x = np.arange(len(subject_x))
                    plt.xticks(subject_x, subjects)

                    plt.bar(subject_x-width, ut2_y, color="#444444",
                            label="UT-2", width=width)
                    plt.bar(subject_x, sa_2_y, color="#008fd5",
                            label="SA-2", width=width)
                    plt.legend()
                    plt.title("Marks of Term 2")
                    plt.xlabel("Subjects")
                    plt.ylabel("Marks")
                    plt.tight_layout()
                    plt.show()

                else:
                    marks = Marks.objects.filter(
                        examName__examName='UT-1', classroomStudent=class_student)
                    ut1_y = []
                    for subject in subject_x:
                        ut1_y.append(marks.get(subject=subject).marks)

                    sa_1_y = []
                    marks = Marks.objects.filter(
                        examName__examName='SA-1', classroomStudent=class_student)
                    for subject in subject_x:
                        sa_1_y.append(marks.get(subject=subject).marks)

                    marks = Marks.objects.filter(
                        examName__examName='UT-2', classroomStudent=class_student)
                    ut2_y = []
                    for subject in subject_x:
                        ut2_y.append(marks.get(subject=subject).marks)

                    sa_2_y = []
                    marks = Marks.objects.filter(
                        examName__examName='SA-2', classroomStudent=class_student)
                    for subject in subject_x:
                        sa_2_y.append(marks.get(subject=subject).marks)

                    width = 0.18
                    subjects = subject_x
                    subject_x = np.arange(len(subject_x))
                    plt.xticks(subject_x, subjects)

                    plt.bar(subject_x-width, ut1_y, color="#444444",
                            label="UT-1", width=width, align='center')
                    plt.bar(subject_x, sa_1_y, color="#008fd5",
                            label="SA-1", width=width, align='center')
                    plt.bar(subject_x+width, ut2_y, color="#4d6c67",
                            label="UT-2", width=width, align='center')
                    plt.bar(subject_x + width+width, sa_2_y, color="#c7ea56",
                            label="SA-2", width=width, align='center')
                    plt.legend()
                    plt.title("Marks of Term 1 & Term 2")
                    plt.xlabel("Subjects")
                    plt.ylabel("Marks")
                    # plt.tight_layout()
                    plt.show()
            except:
                messages.error(
                    request, "Ensure that marks and subjects are entered properly")
                redirect('reportStudent')
            redirect('reportStudent')
    return render(request, 'marks/studentReport.html')


def class_report_analysis(request):
    """
    Generate two graphs one for pass/fail and other for min/max/avg in classroom.
    Input: Class/Section
    Output: Two graph, pass/fail pie chart & bar graph of min/max/avg
    """
    if request.method == "GET":
        plt.style.use("fivethirtyeight")
        if "class_room" in request.GET:
            class_room = request.GET["class_room"]
            marks = Marks.objects.filter(
                classroomStudent__classRoom__classSection=class_room)
            # ut_marks = marks.filter(examName__examName='UT-1') | marks.filter(examName__examName='UT-2')
            sa_marks = marks.filter(
                examName__examName='SA-1') | marks.filter(examName__examName='SA-2')
            pass_students = 0
            fail_students = 0
            didnt_appear = 0
            for sa_mark in sa_marks:
                if sa_mark.marks >= 33:
                    pass_students += 1
                elif sa_mark.marks < 33:
                    fail_students += 1
                else:
                    didnt_appear += 1
            labels = ['Pass', 'Fail', "Didn't Appear"]
            slices = [pass_students, fail_students, didnt_appear]
            plt.pie(slices, labels=labels, startangle=90, autopct='%1.1f%%')
            plt.title(f"Report for {class_room}")
            plt.tight_layout()
            plt.show()

            # max, min and abg bar graph
            class_room = ClassRoom.objects.get(classSection=class_room)
            subject_x = []
            exam_mapping = ExamMapping.objects.filter(classroom=class_room)

            # get subjects
            for a in exam_mapping:
                if a.subject not in subject_x:
                    subject_x.append(a.subject)
            subject_x.sort()
            # get min,max,avg for each subject and plot bar graph
            highest = []
            minimum = []
            average = []
            marks = marks.filter(
                examName__examName='SA-1') | marks.filter(examName__examName='SA-2')

            for sub in subject_x:
                _marks = marks.filter(subject=sub)
                highest_marks = 0
                total_marks = 0
                min_marks = 999
                count = len(_marks)
                for mark in _marks:
                    # count += 1
                    total_marks += mark.marks
                    if mark.marks > highest_marks:
                        highest_marks = mark.marks
                    if mark.marks < min_marks:
                        min_marks = mark.marks

                average.append(total_marks/count)
                highest.append(highest_marks)
                minimum.append(min_marks)

            width = 0.22
            subjects = subject_x
            subject_x = np.arange(len(subject_x))
            plt.xticks(subject_x, subjects)
            plt.bar(subject_x - width, highest, color="#444444",
                    label="Max Marks", width=width, align='center')
            plt.bar(subject_x, average, color="#008fd5",
                    label="Avg Marks", width=width, align='center')
            plt.bar(subject_x + width, minimum, color="#4d6c67",
                    label="Min Marks", width=width, align='center')
            plt.legend()
            plt.title("Max, Avg and Min Standing")
            plt.xlabel("Subjects")
            plt.ylabel("Marks")
            plt.show()
            redirect('reportClass')

    return render(request, 'marks/classReport.html', {"class_rooms": ClassRoom.objects.all()})
