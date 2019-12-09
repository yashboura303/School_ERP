from django.db import models

from django.contrib.auth.models import User


class UserProfile(models.Model):
	"""User Table"""
	user = models.OneToOneField(User,on_delete="CASCADE")
	user_type = models.CharField(max_length=20,default="")
	mobile_no = models.BigIntegerField(default=0)