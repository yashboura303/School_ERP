# Generated by Django 2.2.5 on 2019-12-24 07:50

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('newsletter', '0007_merge_20191223_2217'),
    ]

    operations = [
        migrations.AlterField(
            model_name='newsletter',
            name='date',
            field=models.DateField(default=django.utils.timezone.now),
        ),
    ]
