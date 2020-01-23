"""
student form urls
"""
from django.urls import path
from . import views

urlpatterns = [
    path('addAlbum', views.add_album, name="addAlbum"),
    path('addPhoto', views.add_photo, name="addPhoto"),
    path('addVideo', views.add_video, name="addVideo"),
]
