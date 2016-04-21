from __future__ import unicode_literals
from django .utils import timezone
from django.db import models

# Create your models here.
class Address(models.Model):
    aid = models.AutoField(primary_key=True)
    city = models.CharField(max_length=20)
    state = models.CharField(max_length=20)
    country = models.CharField(max_length=20)

    def __str__(self):
        return self.city + " " + self.state + " " + self.country


class Donor(models.Model):
    username = models.CharField(max_length=200, default='')
    password = models.CharField(max_length=200, default='')
    name = models.CharField(max_length=200)
    age = models.PositiveIntegerField()
    did = models.AutoField(primary_key=True)
    donor_blood_group_choices = (
        (0, 'Select'),
        (1,'A+'),
        (2, 'A-'),
        (3, 'B+'),
        (4, 'B-'),
        (5, 'AB+'),
        (6, 'AB-'),
        (7, 'O+'),
        (8, 'O+'),
        (9, 'O-'),
        (10, 'A1+'),
        (11, 'A1-'),
        (12, 'A2+'),
        (13, 'A2-'),
        (14, 'A1B+'),
        (15, 'A1B-'),
        (16, 'A2B+'),
        (17, 'A2B-'),
        (18, 'Bombay Blood')
    )
    blood_group = models.CharField(max_length=2, choices=donor_blood_group_choices, default=0)
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
    name = models.CharField(max_length=20)
    username = models.CharField(max_length=200, default='')
    password = models.CharField(max_length=200, default='')
    hid = models.AutoField(primary_key=True)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class BloodRequest(models.Model):
    brid = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=20)
    patient_blood_group_choices =(
        (0, 'Select'),
        (1,'A+'),
        (2, 'A-'),
        (3, 'B+'),
        (4, 'B-'),
        (5, 'AB+'),
        (6, 'AB-'),
        (7, 'O+'),
        (8, 'O+'),
        (9, 'O-'),
        (10, 'A1+'),
        (11, 'A1-'),
        (12, 'A2+'),
        (13, 'A2-'),
        (14, 'A1B+'),
        (15, 'A1B-'),
        (16, 'A2B+'),
        (17, 'A2B-'),
        (18, 'Bombay Blood')
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
