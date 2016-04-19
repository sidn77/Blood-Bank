from django import forms
from .forms import *
from .models import *

class DonorForm(forms.ModelForm):
    class Meta:
        model = Donor
        fields = '__all__'
        exclude = ['aid']

class AddressForm(forms.ModelForm):
        class Meta:
            model = Address
            fields = '__all__'
            exclude = ['aid']

class HospitalLoginForm(forms.ModelForm):
    class Meta:
        model = Hospital
        fields = ['username', 'password']
