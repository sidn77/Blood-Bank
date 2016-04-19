from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from .models import *
from .forms import *
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.shortcuts import  *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.views import logout


def home(request):
    return render(request, 'vampire/index.html')


# DONOR VIEWS ---
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


# HOSPITAL VIEWS
def hospital_login(request):
    if request.method == "POST":
        form = HospitalLoginForm(request.POST)
    else:
        form = HospitalLoginForm()

    success_redirect_url = request.GET.get('next', '/hospital/home')

    if request.user.is_authenticated():
        return HttpResponseRedirect(success_redirect_url)

    if request.method == "POST":
        if not form.is_valid():
            return render_to_response(request, 'hospital/hospital_login.html', {'form': form, 'invalid': True})
        else:
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)

            if user is None:
                return render(request, 'hospital/hospital_login.html', {'form': form, 'invalid': True})
            else:
                request.session['id'] = user.id
                request.session['hospital_name'] = form.instance.username
                login(request, user)
                return HttpResponseRedirect(success_redirect_url)
    else:
        return render(request, 'hospital/hospital_login.html', {'form': form, 'invalid': False})

def hospital_logout(request):
    logout(request)
    redirect_to = request.GET.get(next, '/hospital/login')

    return HttpResponseRedirect(redirect_to)

def hospital_register(request):
    if request.method == "POST":
        form = HospitalRegisterForm(request.POST)

        if form.is_valid():
            print("form is valid")
            hospital_instance = form.save();
            request.session['hospital'] = hospital_instance
            return redirect('hospital_login')
        else:
           return render_to_response('hospital/hospital_register.html', {'form': form})
    else:
        form = HospitalRegisterForm()

    return render(request, 'hospital/hospital_register.html', {'form': form})

@login_required(login_url='/hospital/login')
def hospital_home(request):
    return render(request, 'hospital/hospital_home.html')
