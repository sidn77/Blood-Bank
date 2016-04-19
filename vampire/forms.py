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
>>>>>>> 7605155278005961087262716cc72ca727a8bd4e

class HospitalLoginForm(ModelForm):
    class Meta:
        model = Hospital
        fields = ['username', 'password']
