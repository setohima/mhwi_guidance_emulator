from django.urls import path
from . import views

from django.views.generic import TemplateView
from django.views.decorators.cache import cache_control

urlpatterns = [
    path('', views.top, name='top'),
    path('help/', views.help, name='help'),
    path('privacypolicy/', views.privacypolicy, name='privacypolicy'),
    path('sw.js/', (TemplateView.as_view(template_name="sw.js", content_type='application/javascript', )), name='sw.js'),
]