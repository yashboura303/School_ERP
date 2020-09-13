from django.db import models

# Create your models here.
class Thoughts(models.Model):
    thought = models.TextField()
    timestamp = models.DateField(blank=True)