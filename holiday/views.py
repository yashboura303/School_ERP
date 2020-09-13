from django.shortcuts import render, redirect
from datetime import date
from .models import Holiday
# Create your views here.
def add_holiday(request):
    if request.method=="GET":
        start_date = request.GET.get("start_date")
        if start_date:
            start_date = date(*map(int, start_date.split('-')))
            end_date = request.GET.get("end_date")
            end_date = date(*map(int, end_date.split('-')))
            title = request.GET.get("title")
            Holiday.objects.create(title=title, startDate= start_date, endDate=end_date)
            messages.success(request, "Added Holiday")
            redirect('addHoliday')
    return render(request, 'holiday/addHoliday.html')