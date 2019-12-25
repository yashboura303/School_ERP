from django.shortcuts import render
from .models import Newsletter
# Create your views here.


def home(request):
    if request.method == "GET":
        description = request.GET.get("description")
        if description:
            Newsletter.objects.create(description=description)
    return render(request, 'newsletter/addNewsletter.html')
