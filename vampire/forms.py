from django import forms
from django.forms import ModelForm
from vampire.models import Hospital

class HospitalLoginForm(ModelForm):
    class Meta:
        model = Hospital
        fields = ['username', 'password']
