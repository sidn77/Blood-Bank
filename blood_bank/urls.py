"""blood_bank URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from vampire import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.index, name='index'),
    # donor routes
    url(r'^donor/login', views.donor_login, name='donor_login'),
    # url(r'^donor/logout', views.donor_logout, name='donor_logout'),
    url(r'^donor/register', views.donor_register, name='donor_register'),
    url(r'^donor/home', views.donor_home, name='donor_home'),
    # hospital routes
    url(r'^hospital/login', views.hospital_login, name="hospital_login"),
    url(r'^hospital/logout', views.hospital_logout, name="hospital_logout"),
    url(r'^hospital/register', views.hospital_register, name="hospital_register"),
    url(r'^hospital/home', views.hospital_home, name="hospital_home"),
    # accounts?
    url('^accounts/', include('django.contrib.auth.urls')),
]
