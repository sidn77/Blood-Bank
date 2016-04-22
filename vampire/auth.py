from django.contrib.auth.models import User
from vampire.models import Hospital, Donor

class HospitalDonorAuthBackend(object):
    def authenticate(self, username=None, password=None):
        hospital = Hospital.objects.get(username=username, password=password)
        user = User.objects.get(username=username, password=password)

        if hospital.user.user_id == user.user_id:
            return user
        else:
            return None

        # try:
        #     hospital = Hospital.objects.get(username=username, password=password)
        #     print("trying to login with hospital auth: uname: %s | pwd: %s" % (username, password))
        #     # now add a User
        #     try:
        #         user = hospital.user
        #     except AttributeError as e:
        #         print("user is not a hospital.")
        #         return None
        #     return user
        # except Hospital.DoesNotExist:
        #     print("unsucessful login with uname: %s | password: %s \n------" % (username, password))
        #     return None

    def get_user(self, user_id):
            try:
                return User.objects.get(pk=user_id)
            except User.DoesNotExist:
                return None