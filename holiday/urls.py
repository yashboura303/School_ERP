from django.urls import path
from . import views

urlpatterns = [
    path('', views.add_holiday, name="addHoliday"),

]
