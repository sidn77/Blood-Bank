from django.contrib.auth.models import User
from vampire.models import Hospital, Donor

class HospitalAuthBackend(object):
    def authenticate(self, username=None, password=None):
        try:
            Hospital.objects.get(username=username, password=password)
            print("trying to login with hospital auth: uname: %s | pwd: %s" % (username, password))
            
            # now add a User
            try:
                user = User.objects.get(username=username)
            except User.DoesNotExist:
                user = User(username=username, password='user-password-unused')
                user.save()
            print("successful login with: %s\n-----" % user)
            return user
        except Hospital.DoesNotExist:
            print("unsucessful login with uname: %s | password: %s \n------" % (username, password))
            return None

    def get_user(self, user_id):
            try:
                return User.objects.get(pk=user_id)
            except User.DoesNotExist:
                return None



class DonorAuthBackend(object):
    def authenticate(self, username=None, password=None):
        try:
            Donor.objects.get(username=username, password=password)
            # now add a User
            try:
                user = User.objects.get(username=username)
            except User.DoesNotExist:
                user = User(username=username, password='user-password-unused')
                user.save()
            return user
        except Hospital.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None

