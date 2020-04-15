from django.urls import path
from . import views

from django.views.generic import TemplateView
from django.views.decorators.cache import cache_control

urlpatterns = [
    path('', views.top, name='top'),
    path('new/',views.new, name='new'),
    path('sw.js', (TemplateView.as_view(template_name="sw.js",content_type='application/javascript', )), name='otakarasw'),
]