from django.shortcuts import render, redirect, HttpResponse
from django.contrib import messages
from classform.models import ClassRoom, ClassRoomStudent
from .models import ClassNotice, StudentNotice
from accounts.models import UserProfile
from employeeform.models import Employee, Teacher
from timetable.models import ClassRoomSubjectTeacher
# Create your views here.


def notice_home(request):
    """
    Teacher uploads the notice for a particular class
    Input: Notice File, Notice Text
    """
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
        notice = request.POST.get("notice")
        document = request.FILES.get("noticeFile")
        ClassNotice.objects.create(classRoom=ClassRoom.objects.get(
            classSection=class_section), notice=notice, notice_document=document)
        messages.success(request, "Notice Submitted")
    return render(request, 'notice/noticeHome.html', context)


def search_student(request):
    """
    Search Students to send notice
    """
    students = ClassRoomStudent.objects.all()
    if request.method == "GET":
        print(request.GET)
        if "name" in request.GET:
            name = request.GET["name"]
            students = students.filter(student__fullName__icontains=name)
        if "addNumber" in request.GET:
            add_no = request.GET.get("addNumber")
            students = students.filter(
                student__admissionNumber__icontains=(add_no))
            if students:
                return render(request, 'notice/searchStudent.html', {"students": students, "values": request.GET})
            else:
                messages.error(
                    request, 'Cant find student with entered detail')
                return redirect('searchStudent')
    return render(request, 'notice/searchStudent.html')


def notice__student(request, pk):
    """
    Upload notice for a particular student
    """
    student = ClassRoomStudent.objects.get(student__admissionNumber=(pk))
    if request.method == "POST":
        notice = request.POST.get("notice")
        document = request.FILES.get("noticeFile")
        StudentNotice.objects.create(
            student=student, notice=notice, notice_document=document)
        messages.success(request, "Notice Sent!")
    return render(request, 'notice/noticeStudent.html', {"student": student})


def check_notice_student(request):
    """
    Student can check the personal notice 
    """
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Student":
        addmission_number = user_profile.addmission_number
        notice = StudentNotice.objects.filter(student__student__admissionNumber=addmission_number)
        # notice = StudentNotice.objects.filter(student=student)
        if len(notice)>0:
            return render(request, 'notice/checkStudentNotice.html', {"notices":notice})
        else:
            return render(request, 'notice/checkStudentNotice.html')

def check_class_notice(request):
    """
    Student can check the class notice
    """
    user_profile = UserProfile.objects.get(user=request.user)
    if user_profile.user_type == "Student":
        addmission_number = user_profile.addmission_number
        student = ClassRoomStudent.objects.get(student__admissionNumber=addmission_number)
        class_room = student.classRoom
        notice = ClassNotice.objects.filter(classRoom=class_room)
        if len(notice)>0:
            return render(request, 'notice/checkClassNotice.html', {"notices":notice})
        else:
            return render(request, 'notice/checkClassNotice.html')


def download_class_notice(request, pk):
    """
    Download the notice
    """
    notice = ClassNotice.objects.get(id=pk)
    filename = notice.notice_document.split('/')[-1]
    response = HttpResponse(object_name.file, content_type='text/plain')
    response['Content-Disposition'] = 'attachment; filename=%s' % filename

    return response
