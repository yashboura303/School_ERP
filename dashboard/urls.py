from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="dashboard"),
    path('dashboardProfile', views.profile, name="userProfile"),
    path('switchAccount/<int:pk>/', views.redirect_to_dashboard, name="switchAccount"),
]
