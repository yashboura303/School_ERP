# Generated by Django 2.2.5 on 2019-12-25 16:59

from django.db import migrations, models
import django.db.models.deletion
import homework.models


class Migration(migrations.Migration):

    dependencies = [
        ('classform', '0004_auto_20191210_0011'),
        ('homework', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Syllabus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField()),
                ('document', models.FileField(blank=True, upload_to=homework.models.user_syllabus_path)),
                ('date_published', models.DateField()),
                ('classRoom', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoom')),
            ],
        ),
    ]
