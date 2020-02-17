from django.urls import path
from . import views

from django.views.generic import TemplateView
from django.views.decorators.cache import cache_control

urlpatterns = [
    path('', views.top, name='top'),
]