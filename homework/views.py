from django.shortcuts import render
from classform.models import ClassRoom
from markssection.models import ExamMapping
from .models import HomeWork
from datetime import datetime
# Create your views here.
def homework_home(request):
    subjects = (ExamMapping.objects.all().values('subject').distinct())
    context = {
        "class_rooms":ClassRoom.objects.all(),
        "subjects":subjects
    }
    if request.method=="POST":
        print(request.FILES)
        print(request.POST)
        class_section = request.POST.get("class_room")
        subject = request.POST.get("subject")
        description = request.POST.get("detail")
        document = request.FILES.get("homeworkFile")
        HomeWork.objects.create(classRoom=ClassRoom.objects.get(classSection=class_section), subject=subject, description=description,
        date_published=datetime.today(),document=document)


        
    return render(request, 'homework/addHomework.html', context)

def check_homework(request):
    context = {
        "class_rooms":ClassRoom.objects.all(),
    }
    if request.method=="POST":
        class_section = request.POST.get("class_room")

        homeworks = HomeWork.objects.filter(classRoom=ClassRoom.objects.get(classSection=class_section))
        subjects = (ExamMapping.objects.all().values('subject').distinct())

        

    return render(request, 'homework/checkHomework.html', context)