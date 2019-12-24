from django.shortcuts import render, redirect
from dailythought.models import Thoughts
from newsletter.models import Newsletter
from django.contrib.auth.decorators import login_required
from django.contrib import messages,auth
import datetime
from random import randrange
from accounts.models import UserProfile

# Create your views here.

@login_required
def home(request):
    thought = Thoughts.objects.all()
    if thought[0].timestamp != datetime.date.today():
        thought[0].timestamp = datetime.date.today()
        today_thought = thought.get(id=randrange(len(thought))+7)
    else:
        today_thought = thought.last()

    news = Newsletter.objects.filter(date=datetime.date.today())

    profile = UserProfile.objects.get(user=request.user)



    return render(request, 'dashboard/dashboard.html', {"thought": today_thought, "news": news, "profile":profile})

@login_required
def profile(request):
    profile = UserProfile.objects.get(user=request.user)
    if request.method == "POST":
        username = request.POST.get('username')
        name = request.POST.get('first_name')
        mobile_no = request.POST.get('phonenumber')
        profile.mobile_no = mobile_no
        profile.user.username = username
        request.user.username = username
        request.user.save()
        print("name",name)
        profile.fullName = name
        
        # profile.user.save()
        profile.save()
        if request.FILES.get("profile_picture"):
            profile.image = request.FILES.get('profile_picture')
        current_password = request.POST.get('current_password')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        
        if current_password:
            _user = auth.authenticate(
            username=username, password=current_password)
            if _user is not None:             
                if password1 == password2:
                    request.user.set_password(password1)
                    request.user.save()
                    profile.save()
                    auth.login(request, _user)
                    return render(request, 'dashboard/profile.html',{'profile':profile})
            else:
                messages.error(request, "Passwords didn't match!")
                redirect('userProfile')
        else:
            profile.save()
            return render(request, 'dashboard/profile.html',{'profile':profile})

    return render(request, 'dashboard/profile.html',{'profile':profile})