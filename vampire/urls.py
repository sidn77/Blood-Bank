from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'new$', views.donor_new, name='donor_new'),
    url(r'^home$', views.donor_home, name='donor_home'),

]

