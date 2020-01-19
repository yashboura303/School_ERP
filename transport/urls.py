"""
Urls for notice app
"""

from django.urls import path
from . import views

urlpatterns = [
    path('addVehicle', views.vehicle_register, name="addVehicle"),
    path('addDriver', views.driver_register, name="addDriver"),
    path('addRoute', views.route_register, name="addRoute"),
    path('vehicleList', views.vehicle_list, name="vehicleList"),
    path('vehicleListExcel', views.vehicle_list_excel, name="vehicleListExcel"),
    path('vehicleListPdf', views.vehicle_list_pdf, name="vehicleListPdf"),

]
