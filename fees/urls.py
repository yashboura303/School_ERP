from django.urls import path
from . import views

urlpatterns = [
    path('addFine/', views.add_fine, name="addFine"),
    path('addFeeClass/', views.add_fee_class, name="addFeeClass"),
    path('addFeeCategory/', views.set_fee_category, name="addFeeCategory"),
    path('', views.home, name="feesHome"),

]
