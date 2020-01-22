# Generated by Django 2.2.5 on 2020-01-21 17:57

import datetime
from django.db import migrations, models
import visitors.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Visitor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('mobile_no', models.BigIntegerField()),
                ('date_time', models.DateTimeField(default=datetime.datetime(2020, 1, 21, 23, 27, 32, 598301))),
                ('contact_to', models.CharField(max_length=30)),
                ('address', models.CharField(max_length=50)),
                ('purpose', models.TextField(max_length=30)),
                ('photo', models.FileField(upload_to=visitors.models.user_directory_path)),
                ('document', models.FileField(upload_to=visitors.models.user_directory_path)),
            ],
        ),
    ]