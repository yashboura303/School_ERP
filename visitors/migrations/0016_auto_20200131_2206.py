# Generated by Django 2.2.5 on 2020-01-31 16:36

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('visitors', '0015_auto_20200130_0135'),
    ]

    operations = [
        migrations.AlterField(
            model_name='visitor',
            name='date_time',
            field=models.DateTimeField(default=datetime.datetime(2020, 1, 31, 22, 6, 24, 553470)),
        ),
    ]
