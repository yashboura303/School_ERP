# Generated by Django 2.2.5 on 2020-01-29 20:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('form', '0016_auto_20200130_0118'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentroute',
            name='route_code',
            field=models.BigIntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='studentroute',
            name='route_stoppage',
            field=models.CharField(blank=True, max_length=30),
        ),
        migrations.AlterField(
            model_name='studentroute',
            name='shift',
            field=models.CharField(blank=True, max_length=30),
        ),
    ]
