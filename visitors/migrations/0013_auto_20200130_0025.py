# Generated by Django 2.2.5 on 2020-01-29 18:55

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('visitors', '0012_auto_20200127_2225'),
    ]

    operations = [
        migrations.AlterField(
            model_name='visitor',
            name='date_time',
            field=models.DateTimeField(default=datetime.datetime(2020, 1, 30, 0, 25, 8, 477837)),
        ),
    ]