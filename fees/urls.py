from django.urls import path
from . import views

urlpatterns = [
    path('addFine/', views.add_fine, name="addFine"),
    path('addFeeClass/', views.add_fee_class, name="addFeeClass"),
    path('addFeeCycle/', views.add_fee_cycle, name="addFeeCycle"),
    path('addFeeCategory/', views.set_fee_category, name="addFeeCategory"),
    path('addFeeDiscount/', views.fee_discount, name="addFeeDiscount"),
    path('', views.home, name="feesHome"),

]
