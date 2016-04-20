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
    age = models.IntegerField()
    did = models.AutoField(primary_key=True)
    blood_type = models.CharField(max_length=2)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class BloodBank(models.Model):
    name = models.CharField(max_length=200)
    bbid = models.AutoField(primary_key=True)
    longitude = models.DecimalField(max_digits=5,decimal_places=2)
    latitude = models.DecimalField(max_digits=5,decimal_places=2)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class BloodSample(models.Model):
    bsid = models.AutoField(primary_key=True)
    donation_date = models.DateTimeField(default=timezone.now)
    volume = models.DecimalField(max_digits=5, decimal_places=2)
    did = models.ForeignKey(Donor, on_delete=models.CASCADE)
    bbid = models.ForeignKey(BloodBank, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.bsid)

class Hospital(models.Model):
    name = models.CharField(max_length=20)
    username = models.CharField(max_length=200, default='')
    password = models.CharField(max_length=200, default='')
    hid = models.AutoField(primary_key=True)
    longitude = models.DecimalField(max_digits=5,decimal_places=2)
    latitude = models.DecimalField(max_digits=5,decimal_places=2)
    aid = models.ForeignKey(Address, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Reserves(models.Model):
    date_reserved = models.DateTimeField(default=timezone.now)
    cost = models.IntegerField()
    hid = models.ForeignKey(Hospital, on_delete=models.CASCADE)
    bsid = models.ForeignKey(BloodSample, on_delete=models.CASCADE)

