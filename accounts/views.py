"""
  Handle login, signup and logout
"""
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import auth, messages
from accounts.models import UserProfile



def login(request):
    "login user"
    if request.method == 'POST':

        user = auth.authenticate(
            username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            user_profile = UserProfile.objects.get(user=user)
            if user_profile.user_type == "Admin":
                auth.login(request, user)
                return redirect('dashboard')
            else:
                return redirect('home')
        else:
            messages.error(request, 'Invalid credentials')
            return redirect('login')
    return render(request, 'login.html')


def signup(request):
    "signup user"
    if request.method == 'POST':
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.get(username=request.POST['username'])
                if user:
                    messages.error(request, 'Username already exists!')
                    return render(request, 'signup.html')

            except User.DoesNotExist:
                user = User.objects.create_user(
                    request.POST['username'], password=request.POST['password1'],
                    first_name=request.POST['name'])
                auth.login(request, user)
                user_profile = UserProfile.objects.create(
                    user=request.user)
                user_profile.mobile_no = request.POST["phonenumber"]
                user_profile.user_type = request.POST["usertype"]
                user_profile.save()
                return redirect('home')
        else:
            messages.error(request, 'Passwords should match')
            return render(request, 'signup.html')
    return render(request, 'signup.html')


def logout(request):
    "logout user"
    if request.method == 'POST':
        auth.logout(request)
        return redirect('home')
