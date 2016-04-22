from django.shortcuts import render, get_object_or_404, redirect
from django.utils import timezone
from .models import *
from .forms import *
from django.contrib.auth.models import User
from django.shortcuts import *
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth.views import logout
from django.db.models.expressions import RawSQL
from django.core.mail import send_mail


def index(request):
    return render(request, 'vampire/index.html')


def django_donor_uname(donor_username):
    return 'donor_' + donor_username


def django_hospital_uname(hospital_username):
    return 'hospital_' + hospital_username


# DONOR VIEWS ---
@login_required(login_url='/donor/login')
def donor_home(request):
    return render(request, 'donor/donor_home.html')


def donor_register(request):
    if request.method == "POST":
        form = DonorRegisterForm(request.POST)

        if form.is_valid():
            donor = form.save(commit=False)
            user = User(username=django_donor_uname(form.cleaned_data["username"]))
            user.set_password(form.cleaned_data["password"])
            user.save()

            donor.user = user
            donor.save()
            return redirect('donor_login')
        else:
            return render(request,
                          'donor/donor_register.html',
                          {'form': form})
    else:
        form = DonorRegisterForm()

    return render(request, 'donor/donor_register.html',
                           {'form': form})


def donor_login(request):
    HTML_TO_RENDER = 'donor/donor_login.html'
    SUCCESS_REDIRECT_URL = request.GET.get('next', '/donor/home')

    if request.method == "POST":
        form = DonorLoginForm(request.POST)
    else:
        form = DonorLoginForm()

    def login_render(invalid):
            return render(request, HTML_TO_RENDER,
                          {'form': form, 'invalid': invalid})

    if request.user.is_authenticated():
        try:
            request.user.donor
        except Donor.DoesNotExist:
            hospital_logout(request)

        return HttpResponseRedirect(SUCCESS_REDIRECT_URL)

    if request.method == "GET":
        return login_render(invalid=False)

    else:
        if not form.is_valid():
            print("FORM INVALID")
            return login_render(invalid=True)

        username = django_donor_uname(form.cleaned_data['username'])
        password = form.cleaned_data['password']
        user = authenticate(username=username, password=password)

        if user is None:
            print("FOUND NO USER | uname: %s | passwd: %s" % (username, password))
            return login_render(invalid=True)

        try:
            donor = user.donor
        except Donor.DoesNotExist:
            print("trying to login DONOR as HOSPITAL.")
            return login_render(invalid=True)

        request.session['id'] = user.id
        request.session['donor_name'] = donor.name
        login(request, user)
        return HttpResponseRedirect(SUCCESS_REDIRECT_URL)


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
            hospital = form.save(commit=False)
            user = User(username=django_hospital_uname(form.cleaned_data["username"]))
            user.set_password(form.cleaned_data["password"])
            user.save()

            hospital.user = user
            hospital.save()
            return redirect('hospital_login')
        else:
            return render(request,
                          'hospital/hospital_register.html',
                          {'form': form})
    else:
        form = HospitalRegisterForm()

    return render(request, 'hospital/hospital_register.html',
                           {'form': form})


def hospital_login(request):
    HTML_TO_RENDER = 'hospital/hospital_login.html'
    SUCCESS_REDIRECT_URL = request.GET.get('next', '/hospital/home')

    def login_render(invalid):
            return render(request, HTML_TO_RENDER,
                          {'form': form, 'invalid': invalid})

    if request.method == "POST":
        form = HospitalLoginForm(request.POST)
    else:
        form = HospitalLoginForm()

    if request.user.is_authenticated():
        try:
            request.user.hospital
        except Hospital.DoesNotExist:
            donor_logout(request)

        return HttpResponseRedirect(SUCCESS_REDIRECT_URL)

    if request.method == "GET":
        return login_render(invalid=False)

    else:
        if not form.is_valid():
            return login_render(invalid=True)

        username = django_hospital_uname(form.cleaned_data['username'])
        password = form.cleaned_data['password']
        user = authenticate(username=username, password=password)

        if user is None:
            return login_render(invalid=True)

        try:
            hospital = user.hospital
        except Hospital.DoesNotExist:
            print("trying to login hospital as donor.")
            return login_render(invalid=True)

        request.session['id'] = user.id
        request.session['hospital_id'] = hospital.hid
        request.session['hospital_name'] = hospital.name
        login(request, user)
        return HttpResponseRedirect(SUCCESS_REDIRECT_URL)


def hospital_logout(request):
    logout(request)
    redirect_to = request.GET.get(next, '/hospital/login')

    return HttpResponseRedirect(redirect_to)

# Blood Request


def blood_request(request):
    if request.method == "POST":
        form = BloodRequestForm(request.POST)
    else:
        form = BloodRequestForm()

    if form.is_valid():
        blood_request_instance = form.save(commit=False)
        blood_request_instance.hid = Hospital(hid=request.session['hospital_id'])
        blood_request_instance.save()

        blood_group = form.cleaned_data['blood_group']
        aid = form.cleaned_data['aid']
        result = Donor.objects.raw('select * from vampire_donor where blood_group = %s',
                                   [blood_group])
        for d in result:
            result = Address.objects.raw(
                'select aid, country, state, city from vampire_address where aid = %s',
                [d.aid_id])
            email = d.email
            print (email)
        #send_mail('test email', 'hello bro', 'bandninc666@gmail.com', ['email'])
        return redirect('blood_request_accepted')
    else:
        return render(request, 'vampire/blood_request.html', {'form': form})


def donor_search(request):
    if request.method == 'POST':
        form = DonorSearchForm(request.POST)
        if form.is_valid():
            blood_group = form.cleaned_data['blood_group']
            country = form.cleaned_data['country']
            state = form.cleaned_data['state']
            city = form.cleaned_data['city']
            result = Donor.objects.raw('select did, name, aid_id from vampire_donor where blood_group = %s', [blood_group])
            names_addresses = []
            for p in result:
                name = p.name
                status = p.status
                mob = p.mobile_number
                have_one_check = False
                raw_address_query = 'select * from vampire_address'

                all_search_fields = [(city, 'city'), (state, 'state'), (country, 'country')]
                search_params_dict = {}

                for (field, field_name) in all_search_fields:
                    if field != '':
                        if not have_one_check:
                            raw_address_query += ' where '
                            have_one_check = True
                        else:
                            raw_address_query += ' and '

                        raw_address_query += ' soundex(' + field_name + ') = soundex(%(' + field_name + ')s) '
                        search_params_dict[field_name] = field

                print(">> raw_address_query : |%s|" % raw_address_query)
                result = Address.objects.raw(raw_address_query, search_params_dict)

                # if city != '':
                #     result = Address.objects.raw(
                #         'select * from vampire_address where aid = %s and soundex(city) = soundex(%s)',
                #         [p.aid_id, city]
                #     )
                # elif state != '':
                #     result = Address.objects.raw(
                #         'select * from vampire_address where aid = %s and soundex(state) = soundex(%s)',
                #         [p.aid_id, state]
                #     )
                # elif country != '':
                #     result = Address.objects.raw(
                #         'select * from vampire_address where aid = %s and soundex(country) = soundex(%s)', [p.aid_id, country])
                # else:
                #     result = Address.objects.raw('select * from vampire_address where aid = %s', [p.aid_id])
                # print (result)
                for addr in result:
                    print (addr)
                    tuple = name, addr.city, addr.state, addr.country, status, mob
                    names_addresses.append(tuple)

            return render_to_response('vampire/donor_search_result.html', {'names_addresses': names_addresses})
    else:
        form = DonorSearchForm()

    return render(request, 'vampire/donor_search.html', {'form': form,})


def blood_request_accepted(request):
    return render(request, 'vampire/blood_request_accepted.html')
