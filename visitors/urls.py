
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="visitorForm"),
    path('visitorList', views.visitor_list, name="visitorList"),
]
