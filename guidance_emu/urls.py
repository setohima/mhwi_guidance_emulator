from django.urls import path
from . import views

urlpatterns = [
    path('', views.top, name='top'),
    path('help/', views.help, name='help'),
    path('privacypolicy/', views.privacypolicy, name='privacypolicy'),
]