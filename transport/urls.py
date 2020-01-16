"""
Urls for notice app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('', views.transport, name="addVehicle"),

]
