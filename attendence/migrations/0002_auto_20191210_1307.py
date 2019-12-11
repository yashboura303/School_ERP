# Generated by Django 2.2.5 on 2019-12-10 07:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('attendence', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentattendence',
            name='student',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoomStudent'),
        ),
        migrations.AlterField(
            model_name='teacherattendence',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employeeform.Teacher'),
        ),
    ]
