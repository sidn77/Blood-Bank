from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from .models import *
from .forms import *
from django.shortcuts import redirect

def home(request):
    return render(request, 'vampire/home.html')

def donor_home(request):
    return render(request, 'donor/donor_home.html')

def donor_new(request):
    if request.method == "POST":
        form = DonorForm(request.POST)
        if form.is_valid():
            donor = form.save(commit=False)
            donor.name = request.user
            donor.age = request.user
            donor.blood_type = request.user
            donor.save()
            return redirect('donor_home', donor_id=donor.pk)
    else:
        form = DonorForm()
    return render(request, 'donor/donor_edit.html', {'form': form})

def donor_edit(request, donor_id):
    donor = get_object_or_404(Donor, pk=donor_id)
    if request.method == "POST":
        form = DonorForm(request.POST, instance=donor)
        if form.is_valid():
            form.save()
            return redirect('donor_detail', donor_id=donor.pk)
    else:
        form = DonorForm(instance=donor)
    return render(request, 'donor/donor_edit.html', {'form': DonorForm})

    