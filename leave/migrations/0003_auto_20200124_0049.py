# Generated by Django 2.2.5 on 2020-01-23 19:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('leave', '0002_auto_20200124_0025'),
    ]

    operations = [
        migrations.AddField(
            model_name='employeeleave',
            name='rejected',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='studentleave',
            name='rejected',
            field=models.BooleanField(default=False),
        ),
    ]
