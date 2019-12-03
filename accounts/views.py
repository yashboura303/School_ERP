from django.shortcuts import render

from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.contrib import auth,messages
from accounts.models import UserProfile

def login(request):
	if request.method == 'POST':
		user = auth.authenticate(username=request.POST['username'],password=request.POST['password'])
		if user is not None:
			auth.login(request,user)
			return redirect('home')
		else:
			messages.error(request, 'Invalid credentials')
			return redirect('login')
	return render (request, 'login.html')

def signup(request):
    if request.method == 'POST':
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.get(username=request.POST['username'])
                if user:
                    messages.error(request, 'Username already exists!')
                    return render(request, 'signup.html')
                
            except User.DoesNotExist:
	            user = User.objects.create_user(request.POST['username'],password=request.POST['password1'],first_name = request.POST['name'])
	            auth.login(request,user)
	            userProfile, created = UserProfile.objects.get_or_create(user = request.user)
	            userProfile.mobile_no = request.POST["phonenumber"]
	            userProfile.user_type = request.POST["usertype"]
	            userProfile.save()
	            return redirect('home')
        else:
        	messages.error(request,'Passwords should match')
        	return render(request, 'signup.html')
    else:
  	      return render(request, 'signup.html')

def logout(request):
	if request.method == 'POST':
		auth.logout(request)
		return redirect('home')
