from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from .models import *
from .forms import *
from django.contrib.auth.models import User
from django.shortcuts import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.views import logout

def index(request):
    return render(request, 'vampire/index.html')


# DONOR VIEWS ---
@login_required(login_url='/donor/login')
def donor_home(request):
    return render(request, 'donor/donor_home.html')

def donor_register(request):
    if request.method == "POST":
        form = DonorRegisterForm(request.POST)

        if form.is_valid():
            donor_instance = form.save();
            return redirect('donor_login')
        else:
            return render_to_response('donor/donor_register.html', {'form': form})
    else:
        form = DonorRegisterForm()

    return render(request, 'donor/donor_register.html', {'form': form})

def donor_login(request):
    if request.method == "POST":
        form = DonorLoginForm(request.POST)
    else:
        form = DonorLoginForm()

    success_redirect_url = request.GET.get('next', '/donor/home')

    if request.user.is_authenticated():
        return HttpResponseRedirect(success_redirect_url)

    if request.method =="GET":
        return render(request, 'donor/donor_login.html', {'form': form, 'invalid': False})
    else:
        if not form.is_valid():
            return render_to_response(request, 'donor/donor_login.html', {'form': form, 'invalid': True})
        else:
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            user = authenticate(username=username, password=password)

            if user is None:
                return render(request, 'donor/donor_login.html', {'form': form, 'invalid': True})
            else:
                request.session['id'] = user.id
                request.session['donor_name'] = form.instance.name
                login(request, user)
                return HttpResponseRedirect(success_redirect_url)

def donor_logout(request):
    logout(request)
    redirect_to = request.GET.get(next, '/donor/login')

    return HttpResponseRedirect(redirect_to)

# HOSPITAL VIEWS ---
@login_required(login_url='/hospital/login')
def hospital_home(request):
    return render(request, 'hospital/hospital_home.html')

def hospital_register(request):
    if request.method == "POST":
        form = HospitalRegisterForm(request.POST)

        if form.is_valid():
            print("form is valid")
            hospital_instance = form.save();
            return redirect('hospital_login')
        else:
           return render_to_response('hospital/hospital_register.html', {'form': form})
    else:
        form = HospitalRegisterForm()

    return render(request, 'hospital/hospital_register.html', {'form': form})

def hospital_login(request):
    if request.method == "POST":
        form = HospitalLoginForm(request.POST)
    else:
        form = HospitalLoginForm()

    success_redirect_url = request.GET.get('next', '/hospital/home')

    if request.user.is_authenticated():
        return HttpResponseRedirect(success_redirect_url)

    if request.method =="GET":
        return render(request, 'hospital/hospital_login.html', {'form': form, 'invalid': False})
    else:
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
                request.session['hospital_name'] = form.instance.name
                login(request, user)
                return HttpResponseRedirect(success_redirect_url)


def hospital_logout(request):
    logout(request)
    redirect_to = request.GET.get(next, '/hospital/login')

    return HttpResponseRedirect(redirect_to)






