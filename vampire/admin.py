from django.contrib import admin
from vampire.models import Address, BloodBank, Donor, Hospital, BloodRequest
# Register your models here.
admin.site.register(Address)
admin.site.register(BloodBank)
admin.site.register(Donor)
admin.site.register(Hospital)
admin.site.register(BloodRequest)
