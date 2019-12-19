from django.shortcuts import render
from dailythought.models import Thoughts
from newsletter.models import Newsletter
import datetime
from random import randrange

# Create your views here.


def home(request):
    thought = Thoughts.objects.all()
    if thought[0].timestamp != datetime.date.today():
        thought[0].timestamp = datetime.date.today()
        today_thought = thought.get(id=randrange(len(thought))+7)
    else:
        today_thought = thought.last()

    news = Newsletter.objects.filter(date=datetime.date.today())

    return render(request, 'dashboard.html', {"thought": today_thought, "news": news})
