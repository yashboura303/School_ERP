# Generated by Django 2.2.5 on 2020-01-17 17:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transport', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='vehicle',
            name='service_date',
            field=models.DateField(blank=True, null=True),
        ),
    ]