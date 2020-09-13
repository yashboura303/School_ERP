from django.db import models
from PIL import Image

from django.contrib.auth.models import User


class UserProfile(models.Model):
	"""User Table"""
	user = models.OneToOneField(User,on_delete=models.CASCADE)
	fullName = models.CharField(max_length=50, default="")
	user_type = models.CharField(max_length=20,default="")
	mobile_no = models.BigIntegerField(default=0)
	image = models.ImageField(default='default.jpg',upload_to ='profile_pics')
	emp_id = models.BigIntegerField(default=0)
	addmission_number = models.BigIntegerField(default=0)
	password = models.CharField(max_length=100,default="")

	def __str__(self):
		return f"{self.user}"
	
	def save(self, *args, **kwargs):
		super(UserProfile, self).save(*args, **kwargs)
		try:
			img = Image.open(self.image.path)  # Open image using self
			if img.height > 300 or img.width > 300:
				new_img = (300, 300)
				img.thumbnail(new_img)
				img.save(self.image.path)
		except:
			pass