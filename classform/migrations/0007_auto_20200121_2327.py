# Generated by Django 2.2.5 on 2020-01-21 17:57

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classform', '0006_studentrouteattendence'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentrouteattendence',
            name='time',
            field=models.DateTimeField(blank=True, default=datetime.datetime.now),
        ),
    ]
