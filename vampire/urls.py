from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.donor_home, name='donor_home'),
    url(r'new$', views.donor_new, name='donor_new'),
    url(r'login/$', 'django.contrib.auth.views.login'),
    url(r'logout/$', 'django.contrib.auth.views.logout'),
]

