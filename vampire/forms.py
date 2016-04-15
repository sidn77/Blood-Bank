from django import forms
from .models import *

class DonorForm(forms.ModelForm):

    class Meta:
        model = Donor
        fields = ('name', 'age', 'blood_type')
