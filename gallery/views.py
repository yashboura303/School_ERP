from django.shortcuts import render, HttpResponse
from .models import Album, Photo, Video
# Create your views here.
def add_album(request):
	if request.method == "POST":
		album = request.FILES.get("album")
		album_name = request.POST.get("album_name")
		Album.objects.create(album_name=album_name, file=album)
		messages.success(request, "Uploaded File")
	return render(request, 'gallery/album.html')

def add_video(request):
	if request.method == "POST":
		video = request.FILES.get("video")
		video_name = request.POST.get("video_name")
		Video.objects.create(video_name=video_name, file=video)
		messages.success(request, "Uploaded File")
	return render(request, 'gallery/video.html')

def add_photo(request):
	if request.method == "POST":
		photo = request.FILES.get("photo")
		photo_name = request.POST.get("photo_name")
		Photo.objects.create(photo_name=photo_name, file=photo)
		messages.success(request, "Uploaded File")
	return render(request, 'gallery/photo.html')