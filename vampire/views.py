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
        dform = DonorForm(request.POST)
        aform = AddressForm(request.POST)
        if dform.is_valid() and aform.is_valid():
            donor = dform.save(commit=False)
            address = aform.save(commit=False)
            donor.name = request.user.id
            donor.age = request.user.id
            donor.blood_type = request.user.id
            address.city = request.user.id
            address.state = request.user.id
            address.country = request.user.id
            address.aid = Address.objects.get(aid=' ')
            address.save()
            donor.save()
            return redirect('donor_home', donor_id=donor.pk)
    else:
        dform = DonorForm()
        aform = AddressForm()
    return render(request, 'donor/donor_edit.html', {'donor_form': dform, 'address_form': aform})

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

    