# Generated by Django 2.2.5 on 2020-02-06 17:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('form', '0019_studentinfo_deleted'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='studentinfo',
            name='deleted',
        ),
    ]