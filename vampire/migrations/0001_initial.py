# -*- coding: utf-8 -*-
# Generated by Django 1.9.5 on 2016-04-22 09:50
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('aid', models.AutoField(primary_key=True, serialize=False)),
                ('city', models.CharField(max_length=20)),
                ('state', models.CharField(max_length=20)),
                ('country', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='BloodBank',
            fields=[
                ('username', models.CharField(default='', max_length=200)),
                ('password', models.CharField(default='', max_length=200)),
                ('name', models.CharField(max_length=200)),
                ('bbid', models.AutoField(primary_key=True, serialize=False)),
                ('aid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vampire.Address')),
            ],
        ),
        migrations.CreateModel(
            name='BloodRequest',
            fields=[
                ('brid', models.AutoField(primary_key=True, serialize=False)),
                ('patient_name', models.CharField(max_length=20)),
                ('blood_group', models.CharField(choices=[(0, 'Select'), ('A+', 'A+'), ('A-', 'A-'), ('B+', 'B+'), ('B-', 'B-'), ('AB+', 'AB+'), ('AB-', 'AB-'), ('O+', 'O+'), ('O-', 'O-'), ('A1+', 'A1+'), ('A1-', 'A1-'), ('A2+', 'A2+'), ('A2-', 'A2-'), (('A1B+',), 'A1B+'), ('A1B-', 'A1B-'), ('A2B+', 'A2B+'), ('A2B-', 'A2B-'), ('Bomabay Blood', 'Bombay Blood')], default=0, max_length=2)),
                ('patient_age', models.PositiveIntegerField()),
                ('requirement_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('units', models.DecimalField(decimal_places=2, max_digits=5)),
                ('hospital_name', models.CharField(max_length=20)),
                ('purpose', models.TextField(max_length=200)),
                ('aid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vampire.Address')),
            ],
        ),
        migrations.CreateModel(
            name='Donor',
            fields=[
                ('username', models.CharField(default='', max_length=200, unique=True)),
                ('password', models.CharField(default='', max_length=200)),
                ('name', models.CharField(max_length=200)),
                ('age', models.PositiveIntegerField()),
                ('email', models.EmailField(max_length=254)),
                ('did', models.AutoField(primary_key=True, serialize=False)),
                ('mobile_number', models.CharField(default='', max_length=10)),
                ('status', models.CharField(choices=[(0, 'select'), ('Available', 'Available'), ('Unavailable', 'Unavailable')], default=0, max_length=100)),
                ('blood_group', models.CharField(choices=[(0, 'Select'), ('A+', 'A+'), ('A-', 'A-'), ('B+', 'B+'), ('B-', 'B-'), ('AB+', 'AB+'), ('AB-', 'AB-'), ('O+', 'O+'), ('O-', 'O-'), ('A1+', 'A1+'), ('A1-', 'A1-'), ('A2+', 'A2+'), ('A2-', 'A2-'), (('A1B+',), 'A1B+'), ('A1B-', 'A1B-'), ('A2B+', 'A2B+'), ('A2B-', 'A2B-'), ('Bomabay Blood', 'Bombay Blood')], default=0, max_length=200)),
                ('aid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vampire.Address')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Hospital',
            fields=[
                ('name', models.CharField(max_length=20)),
                ('username', models.CharField(default='', max_length=200, unique=True)),
                ('password', models.CharField(default='', max_length=200)),
                ('hid', models.AutoField(primary_key=True, serialize=False)),
                ('aid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='vampire.Address')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
