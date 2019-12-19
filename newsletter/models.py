from django.db import models
from datetime import date
# Create your models here.
class Newsletter(models.Model):
    description = models.TextField(null=True)
    date = models.DateField(default = date.today())
