from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.donor_home, name='donor_home'),
]

