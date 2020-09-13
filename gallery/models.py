from django.db import models

# Create your models here.
def album_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'gallery/album/{0}/{1}'.format(instance.album_name, filename)
class Album(models.Model):
	album_name = models.CharField(max_length=30)
	file = models.FileField(upload_to=album_directory_path)

def photo_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'gallery/photos/{0}/{1}'.format(instance.photo_name, filename)
class Photo(models.Model):
	photo_name = models.CharField(max_length=30)
	file = models.FileField(upload_to=photo_directory_path)

def video_directory_path(instance, filename):
    """file will be uploaded to given path"""
    return 'gallery/video/{0}/{1}'.format(instance.video_name, filename)
class Video(models.Model):
	video_name = models.CharField(max_length=30)
	file = models.FileField(upload_to=video_directory_path)
