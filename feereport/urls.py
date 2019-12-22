from django.urls import path
from . import views

urlpatterns = [
    path('searchDefaulter/', views.search_defaulter, name="searchDefaulter"),
    path('feeCollectionReport/', views.fee_collection_report, name="feeCollectionReport"),
]
