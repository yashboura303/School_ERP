# Generated by Django 2.2.5 on 2019-12-04 17:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('form', '0005_auto_20191204_1803'),
    ]

    operations = [
        migrations.RenameField(
            model_name='documents',
            old_name='admissionNumber',
            new_name='student',
        ),
    ]
