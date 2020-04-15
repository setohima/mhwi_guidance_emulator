from django.urls import path
from . import views

from django.views.generic import TemplateView
from django.views.decorators.cache import cache_control

urlpatterns = [
    path('', views.top, name='top'),
    path('sw', (TemplateView.as_view(template_name="sw",content_type='application/javascript', )), name='sw.js'),
]