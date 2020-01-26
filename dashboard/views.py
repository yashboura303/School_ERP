from django.shortcuts import render, redirect
from dailythought.models import Thoughts
from newsletter.models import Newsletter
from gallery.models import Photo
from django.contrib.auth.decorators import login_required
from django.contrib import messages, auth
import datetime
from random import randrange
from accounts.models import UserProfile

# Create your views here.


def home(request):
    """
    Main view page of dashboard. 

    """
    if request.user.is_authenticated:
        profile = UserProfile.objects.get(user=request.user)
        thought = Thoughts.objects.all()
        if len(thought) > 0:
            if thought[0].timestamp != datetime.date.today():
                thought[0].timestamp = datetime.date.today()
                print(thought)
                today_thought = thought[randrange(len(thought)-1)]
            else:
                today_thought = thought.last()
            news = Newsletter.objects.filter(date=datetime.date.today())

            context = { "thought": today_thought,
                        "news": news,
                        "profile": profile,
                        "photos": Photo.objects.all()
                    }
            return render(request, 'dashboard/dashboard.html',context)
    else:
        return render(request, 'accounts/login.html')


def profile(request):
    if request.user.is_authenticated:
        profile = UserProfile.objects.get(user=request.user)
        if request.method == "POST":
            username = request.POST.get('username')
            name = request.POST.get('first_name')
            mobile_no = request.POST.get('phonenumber')
            profile.mobile_no = mobile_no
            profile.user.username = username
            request.user.username = username
            request.user.save()
            profile.fullName = name
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
                        messages.info(request, 'Login with your new password')
                        return redirect('userProfile')
                else:
                    messages.error(request, "Passwords didn't match!")
                    redirect('userProfile')
            else:
                profile.save()
                return render(request, 'dashboard/profile.html', {'profile': profile})
        return render(request, 'dashboard/profile.html', {'profile': profile})
    else:
        return render(request, 'accounts/login.html')
