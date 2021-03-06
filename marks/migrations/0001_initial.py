# Generated by Django 2.2.5 on 2020-09-13 16:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('classform', '0004_auto_20191210_0011'),
    ]

    operations = [
        migrations.CreateModel(
            name='ExamType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('examType', models.CharField(max_length=50)),
                ('totalMarks', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='SubjectsToClass',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subjects', models.CharField(max_length=50)),
                ('classroom', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoom')),
            ],
        ),
        migrations.CreateModel(
            name='Marks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('classroomStudent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoomStudent')),
                ('examType', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='marks.ExamType')),
            ],
        ),
    ]
