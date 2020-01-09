from django.shortcuts import render, redirect
from .models import Fine, Fee, FeeCategory, FeeCycle, FeeDiscount, ClassSectionFees
from classform.models import ClassRoomStudent, ClassRoom
from datetime import date
# Create your views here.


def add_fine(request):
    if request.method == "GET":
        category = request.GET.get("category")
        fine = request.GET.get("fine")
        add_number = request.GET.get("add_number")
        description = request.GET.get("description")
        if add_number:
            student = ClassRoomStudent.objects.get(
                student__admissionNumber=add_number)
            Fine.objects.create(fine=fine, category=category,
                                description=description, student=student)
            redirect('addFine')
    return render(request, 'fees/addFine.html')


def set_fee_category(request):
    if request.method == "GET":
        description = request.GET.get("description")
        checklist = request.GET.get("check")
        mode = request.GET.get("mode")

        if "recurring" in checklist:
            FeeCategory.objects.create(
                once=False, submission_type=mode, description=description)
        else:
            FeeCategory.objects.create(
                once=True, submission_type="once", description=description)

        return render(request, 'fees/home.html', {"class_rooms": ClassRoom.objects.all()})


def add_fee_class(request):
    if request.method == 'GET':
        fees = request.GET.get("fees")
        classSection = request.GET.get("class_room")
        category = request.GET.get("category")
        if category:
            fee_category = FeeCategory.objects.get(submission_type=category)
            classRoom = ClassRoom.objects.get(classSection=classSection)
            ClassSectionFees.objects.create(classSection=classRoom,
                                            feeCategory=fee_category, fees=fees)
            redirect('addFeeClass')
    return render(request, 'fees/addClassFee.html', {"category": FeeCategory.objects.all(), "class_rooms": ClassRoom.objects.all()})


def add_fee_cycle(request):
    if request.method == 'GET':
        cycle = request.GET.get("cycle")
        starting_date = request.GET.get("starting_date")
        ending_date = request.GET.get("ending_date")
        starting_date = date(*map(int, starting_date.split('-')))
        ending_date = date(*map(int, ending_date.split('-')))
        FeeCycle.objects.create(lastSubmissionDate=ending_date, firstSubmissionDate=starting_date, cycle=cycle)

    return render(request, 'fees/home.html')


def home(request):
    if request.method == 'GET':
        classSection = request.GET.get("class_room")
        payment_method = request.GET.get("payment_method")
        reg_no = request.GET.get("register_number")
        months = request.GET.get("months")
        
        add_number = request.GET.get("add_number") 
        if add_number:   
            classRoom = ClassRoom.objects.get(classSection=classSection)
            student = ClassRoomStudent.objects.get(
                student__admissionNumber=add_number)
            Fee.objects.create(regNo=reg_no, student=student, classSection=classRoom, submissionDate=date.today(),monthsPaid=months, payment_method=payment_method )

    return render(request, 'fees/home.html', {"class_rooms": ClassRoom.objects.all()})


def fee_discount(request):
    if request.method =="GET":
        description = request.GET.get('description')
        add_number = request.GET.get('add_number')
        total_off = request.GET.get('total_off')
        discount = request.GET.get('discount')
        if discount:
            student = ClassRoomStudent.objects.get(
                student__admissionNumber=add_number)
            FeeDiscount.objects.create(discount=discount,student=student, description=description, total_off=total_off)
        return render(request, 'fees/home.html')