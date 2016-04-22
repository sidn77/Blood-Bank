from django import forms
from .forms import *
from .models import *

class DonorRegisterForm(forms.ModelForm):
    class Meta:
        model = Donor
        fields = '__all__'
        exclude = ['did', 'user']
        widgets = {
            'password': forms.PasswordInput(),
        }


class DonorLoginForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Donor
        fields = ['username', 'password']
        widgets = {
            'password': forms.PasswordInput(),
        }


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
        exclude = ['hid', 'user']
        widgets = {
            'password': forms.PasswordInput(),
        }

class HospitalLoginForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Hospital
        fields = ['username', 'password']
        widgets = {
            'password': forms.PasswordInput(),
        }

class BloodRequestForm(forms.ModelForm):
    class Meta:
        model = BloodRequest
        fields = '__all__'
        exlcude = ['brid']


class DonorSearchForm(forms.Form):
    ap = 'A+'
    am = 'A-'
    bp ='B+'
    bm = 'B-'
    abp = 'AB+'
    abm = 'AB-'
    op = 'O+'
    om = 'O-'
    aop = 'A1+'
    aom = 'A1-'
    atp = 'A2+'
    atm = 'A2-'
    aobp = 'A1B+',
    aobm = 'A1B-'
    atbp = 'A2B+'
    atbm = 'A2B-'
    bb = 'Bomabay Blood'
    donor_blood_group_choices = (
        (0, 'Select'),
        (ap, 'A+'),
        (am, 'A-'),
        (bp, 'B+'),
        (bm, 'B-'),
        (abp, 'AB+'),
        (abm, 'AB-'),
        (op, 'O+'),
        (om, 'O-'),
        (aop, 'A1+'),
        (aom, 'A1-'),
        (atp, 'A2+'),
        (atm, 'A2-'),
        (aobp, 'A1B+'),
        (aobm, 'A1B-'),
        (atbp, 'A2B+'),
        (atbm, 'A2B-'),
        (bb, 'Bombay Blood')
    )
    blood_group = forms.ChoiceField(label='Blood Group', initial='select', choices=donor_blood_group_choices)
    country = forms.CharField(label='Country', max_length=20)
    state = forms.CharField(label='State', max_length=20)
    city = forms.CharField(label='City', max_length=20)
