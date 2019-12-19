from django.db import models

# Create your models here.
class Holiday(models.Model):
    title = models.CharField(max_length=50)
    startDate = models.DateField()
    endDate = models.DateField()