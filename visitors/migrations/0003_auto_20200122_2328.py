# Generated by Django 2.2.5 on 2020-01-22 17:58

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('visitors', '0002_auto_20200122_2010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='visitor',
            name='date_time',
            field=models.DateTimeField(default=datetime.datetime(2020, 1, 22, 23, 28, 33, 880680)),
        ),
    ]