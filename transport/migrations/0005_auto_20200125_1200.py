# Generated by Django 2.2.5 on 2020-01-25 06:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transport', '0004_auto_20200118_1141'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vehicle',
            name='id',
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='vehicle_no',
            field=models.BigIntegerField(primary_key=True, serialize=False),
        ),
    ]
