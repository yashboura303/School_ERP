from django.urls import path
from . import views

urlpatterns = [
    path('',views.addClass, name="addClass"),
    # path('update',views.update, name = "updateInfo"),
    # path('search',views.search, name = "searchPage"),
    # path('update/<int:pk>/',views.updateWithData, name ="updateInfoWithData"),
    # path('print/<int:pk>/',views.print, name ="printStudentData"),
]