# Generated by Django 2.2.5 on 2020-01-22 14:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0006_userprofile_fullname'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='fullName',
            field=models.CharField(default='', max_length=50),
        ),
    ]
