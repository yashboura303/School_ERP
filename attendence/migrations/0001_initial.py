# Generated by Django 2.2.5 on 2019-12-09 12:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('employeeform', '0005_auto_20191209_1730'),
        ('form', '0010_auto_20191206_1628'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeacherAttendence',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=50)),
                ('date', models.DateField()),
                ('teacher', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='employeeform.Teacher')),
            ],
        ),
        migrations.CreateModel(
            name='StudentAttendence',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(max_length=50)),
                ('date', models.DateField()),
                ('student', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='form.StudentInfo')),
            ],
        ),
    ]
