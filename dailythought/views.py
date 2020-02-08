from django.shortcuts import render
from . models import Thoughts
import datetime
# Create your views here.
def add_thought(request):
    if request.method=="GET":
        thought = request.GET.get("thought")
        if thought:
        	Thoughts.objects.create(thought=thought, timestamp = datetime.datetime.today())
        	messages.success(request, "Added Thought")
    return render(request, 'dailythought/addThought.html')