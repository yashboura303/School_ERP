# Generated by Django 2.2.5 on 2019-12-21 09:42

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('newsletter', '0004_auto_20191220_1656'),
    ]

    operations = [
        migrations.AlterField(
            model_name='newsletter',
            name='date',
            field=models.DateField(default=datetime.date(2019, 12, 21)),
        ),
    ]
