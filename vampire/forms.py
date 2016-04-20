from django import forms
from .forms import *
from .models import *

class DonorRegisterForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Donor
        fields = '__all__'
        exclude = ['did']

class DonorLoginForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Donor
        fields = ['username', 'password']

class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = '__all__'
        exclude = ['aid']

class HospitalRegisterForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Hospital
        fields = '__all__'
        exclude = ['hid']

class HospitalLoginForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Hospital
        fields = ['username', 'password']
