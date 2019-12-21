from django.shortcuts import render
from classform.models import ClassRoom, ClassRoomStudent
from fees.models import Fee, FeeCategory, FeeCycle, FeeDiscount, ClassSectionFees

# Create your views here.
def search_defaulter(request):
    if request.method == "GET":
        months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'Jul',
          'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        class_section = request.GET.get('classSection')
        if class_section:
            class_room = ClassRoom.objects.get(classSection=class_section)
            fees = Fee.objects.filter(classSection=class_room)
            class_fees = ClassSectionFees.objects.get(classSection=class_room).fees
            months_not_paid = []
            balance_remaining = []
            for f in fees:
                s = ""
                months_paid = f.monthsPaid.split(',')
                for m in months:
                    if m not in months_paid:
                        s+='-'+m
                months_not_paid.append(s)
                balance_remaining.append(class_fees-f.amount)
            print(fees, months_not_paid, balance_remaining)
            mylist = zip(fees, months_not_paid, balance_remaining)
            context = {
                        'mylist': mylist,
                        'values':request.GET,
                    }
            return render(request, 'feereport/defaulterSearch.html',context)


    return render(request, 'feereport/defaulterSearch.html')

def fee_collection_report(request):
    if request.method == "GET":
        print(request.GET)
        fees = Fee.objects.all()
        if "classSection" in request.GET:
            classSection = request.GET['classSection']
            if classSection:
                class_room = ClassRoom.objects.get(classSection=classSection)
                fees = fees.filter(classSection=class_room)
        if "mode" in request.GET:
            mode = request.GET['mode']
            if mode:
                fees = fees.filter(payment_method__contains=mode)
        if "month" in request.GET:
            month = request.GET['month']
            if month:
                fees = fees.filter(submissionDate__month=month)
        if "year" in request.GET:
            year = request.GET['year']
            if year:
                fees = fees.filter(submissionDate__year=year)
        print(fees)
        return render(request, 'feereport/feeCollectionReport.html',{"fees":fees})
    return render(request, 'feereport/feeCollectionReport.html')