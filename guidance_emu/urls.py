from django.urls import path
from . import views

urlpatterns = [
    path('', views.toppen, name='top'),
]