from django import forms
from .forms import *
from .models import *
from django.contrib.auth.models import User


def django_donor_uname(donor_username):
    return 'donor_' + donor_username


def django_hospital_uname(hospital_username):
    return 'hospital_' + hospital_username



class DonorRegisterForm(forms.ModelForm):
    class Meta:
        model = Donor
        fields = '__all__'
        exclude = ['did', 'user']
        widgets = {
            'password': forms.PasswordInput(),
        }

    # def clean(self):
    #     cleaned_data = self.cleaned_data
    #     username = cleaned_data['username']

    #     if username and len(Donor.objects.filter(username=django_donor_uname(username))) > 0:
    #         raise forms.ValidationError("Username must be unique")


class DonorLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput())


class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = '__all__'
        exclude = ['aid']


class HospitalRegisterForm(forms.ModelForm):
    class Meta:
        model = Hospital
        fields = '__all__'
        exclude = ['hid', 'user']
        widgets = {
            'password': forms.PasswordInput(),
        }

    # def clean(self):
    #     cleaned_data = self.cleaned_data
    #     username = cleaned_data['username']

    #     if username and len(Hospital.objects.filter(username=django_hospital_uname(username))) > 0:
    #         raise forms.ValidationError("Username must be unique")

    #     # Always return the full collection of cleaned data.
    #     return cleaned_data


class HospitalLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput())


class BloodRequestForm(forms.ModelForm):
    class Meta:
        model = BloodRequest
        fields = '__all__'
        exclude = ['brid', 'hospital', 'accpted_by', 'donor', 'accepted_by']


class DonorSearchForm(forms.Form):
    ap = 'A+'
    am = 'A-'
    bp = 'B+'
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
    donor_blood_group_choices = [
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
    ]
    blood_group = forms.ChoiceField(label='Blood Group',
                                    choices=donor_blood_group_choices,
                                    initial='select',
                                    required=True)
    country = forms.CharField(label='Country', max_length=20, required=False)
    state = forms.CharField(label='State', max_length=20, required=False)
    city = forms.CharField(label='City', max_length=20, required=False)
