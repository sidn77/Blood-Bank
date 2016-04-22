from __future__ import unicode_literals
from django .utils import timezone
from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Address(models.Model):
    aid = models.AutoField(primary_key=True)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    country = models.CharField(max_length=20)

    def __str__(self):
        return self.city + " " + self.state + " " + self.country


class Donor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    username = models.CharField(max_length=200, default='', unique=True)
    password = models.CharField(max_length=200, default='')
    name = models.CharField(max_length=200)
    age = models.PositiveIntegerField()
    did = models.AutoField(primary_key=True)
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
    blood_group = models.CharField(max_length=200, choices=donor_blood_group_choices, default=0)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class BloodBank(models.Model):
    username = models.CharField(max_length=200, default='')
    password = models.CharField(max_length=200, default='')
    name = models.CharField(max_length=200)
    bbid = models.AutoField(primary_key=True)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Hospital(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    username = models.CharField(max_length=200, default='', unique=True)
    password = models.CharField(max_length=200, default='')
    hid = models.AutoField(primary_key=True)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class BloodRequest(models.Model):
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

    brid = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=20)
    patient_blood_group_choices =(
        (0, 'Select'),
        (ap,'A+'),
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
    blood_group = models.CharField(max_length=2, choices=patient_blood_group_choices, default=0)
    patient_age = models.PositiveIntegerField()
    requirement_date = models.DateTimeField(default=timezone.now)
    units = models.DecimalField(max_digits=5,decimal_places=2)
    hospital_name = models.CharField(max_length=20)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)
    purpose = models.TextField(max_length=200)

    def __str__(self):
        return self.brid

