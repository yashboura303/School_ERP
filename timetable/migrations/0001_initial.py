# Generated by Django 2.2.5 on 2020-01-31 18:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('employeeform', '0007_auto_20200130_0118'),
        ('classform', '0008_auto_20200131_2206'),
    ]

    operations = [
        migrations.CreateModel(
            name='ClassRoomSubjectTeacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subjects', models.CharField(max_length=150)),
                ('class_room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoom')),
                ('teacher', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employeeform.Teacher')),
            ],
        ),
    ]
