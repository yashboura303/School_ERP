from django.shortcuts import render, redirect
from .models import Visitor
from django.contrib import messages
from datetime import date
from datetime import datetime
# Create your views here.
def home(request):
	if request.method == "POST":
		name = request.POST.get("name")
		mobile_no = request.POST.get("mobile_no")
		address = request.POST.get("address")
		contact_to = request.POST.get("contact_to")
		purpose = request.POST.get("purpose")
		photos = request.FILES.get("photos")
		document = request.FILES.get("document")
		Visitor.objects.create(name=name, mobile_no=mobile_no, address=address, purpose=purpose, photo=photos, document=document,contact_to=contact_to, date_time=datetime.now())
		messages.success(request, "Visitor detail added!")
		redirect("visitorForm")
	return render(request, 'visitors/home.html')

def visitor_list(request):
	if request.method == "POST":
		_date = request.POST.get("date")
		_month = request.POST.get("month")
		if _date:
			_date = date(*map(int, _date.split('-')))
			visitors = Visitor.objects.filter(date_time__date=_date)
		else:
			visitors = Visitor.objects.filter(date_time__month=_month)
		return render(request, 'visitors/visitor_list.html', {"visitors":visitors})
	return render(request, 'visitors/visitor_list.html')