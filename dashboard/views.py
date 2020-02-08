from django.shortcuts import render, redirect, HttpResponse
from dailythought.models import Thoughts
from newsletter.models import Newsletter
from gallery.models import Photo
from form.models import StudentInfo
from django.contrib.auth.decorators import login_required
from django.contrib import messages, auth
import datetime
from random import randrange
from accounts.models import UserProfile

# Create your views here.


def home(request):
    """
    Main view page of dashboard. 
    Load thoughts, gallery and newsletter

    """
    if request.user.is_authenticated:
        profile = UserProfile.objects.get(user=request.user)
        thought = Thoughts.objects.all()
        news = Newsletter.objects.filter(date=datetime.date.today())
        if len(thought) > 0:
            if thought[0].timestamp != datetime.date.today():
                thought[0].timestamp = datetime.date.today()
                today_thought = thought[randrange(len(thought)-1)]
            else:
                today_thought = thought.last()
            

            context = { "thought": today_thought,
                        "news": news,
                        "profile": profile,
                        "photos": Photo.objects.all()
                    }
            return render(request, 'dashboard/dashboard.html',context)
        else:
            context = { 
                        "news": news,
                        "profile": profile,
                        "photos": Photo.objects.all()
                    }
            return render(request, 'dashboard/dashboard.html',context)
    else:
        return render(request, 'accounts/login.html')


def profile(request):
    """
    Load profile for the current user. 
    Change password for the account
    Load siblings profile.
    """
    sibling1=False
    sibling2=False
    sibling3=False
    if request.user.is_authenticated:
        profile = UserProfile.objects.get(user=request.user)
        if profile.addmission_number:
            student = StudentInfo.objects.get(admissionNumber=profile.addmission_number)
            if student.siblingID:
                sibling1 = StudentInfo.objects.get(admissionNumber=student.siblingID)
            if student.siblingID0:
                sibling2 = StudentInfo.objects.get(admissionNumber=student.siblingID0)
            if student.siblingID1:
                sibling3 = StudentInfo.objects.get(admissionNumber=student.siblingID1)
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
                        profile.password = password1
                        profile.save()
                        messages.info(request, 'Login with your new password')
                        return redirect('userProfile')
                else:
                    messages.error(request, "Passwords didn't match!")
                    redirect('userProfile')
            else:
                profile.save()
        
        if sibling3:
            return render(request, 'dashboard/profile.html', {'profile': profile, "sibling1":sibling1,"sibling2":sibling2, "sibling3":sibling3})
        if sibling2:
            return render(request, 'dashboard/profile.html', {'profile': profile, "sibling1":sibling1,"sibling2":sibling2})
        if sibling1:
            return render(request, 'dashboard/profile.html', {'profile': profile, "sibling1":sibling1})
        
        return render(request, 'dashboard/profile.html', {'profile': profile})
    else:
        return render(request, 'accounts/login.html')

def redirect_to_dashboard(request, pk):
    """
    Redirect to the clicked Sibling's Dashboard 
    """
    user_profile = UserProfile.objects.get(addmission_number=pk)
    password = user_profile.password
    auth.logout(request)
    user = auth.authenticate(
            username=pk, password=password)
    if user is not None:
        user_profile = UserProfile.objects.get(user=user)
        auth.login(request, user)
        return redirect('dashboard')
    return HttpResponse("Error")