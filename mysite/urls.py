from django.contrib import admin
from django.urls import include, path

from django.views.generic import TemplateView
from django.views.decorators.cache import cache_control

urlpatterns = [
    path('', include('guidance_emu.urls')),
    #path('admin/', admin.site.urls),
    path('sw.js', (TemplateView.as_view(template_name="sw.js",content_type='application/javascript', )), name='sw.js'),
]