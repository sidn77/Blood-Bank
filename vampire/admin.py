from django.contrib import admin
from vampire.models import Address, BloodBank, Donor, Hospital, BloodSample, Reserves
# Register your models here.
admin.site.register(Address)
admin.site.register(BloodBank)
admin.site.register(Donor)
admin.site.register(Hospital)
admin.site.register(BloodSample)
admin.site.register(Reserves)

