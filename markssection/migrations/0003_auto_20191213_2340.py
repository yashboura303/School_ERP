# Generated by Django 2.2.5 on 2019-12-13 18:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('classform', '0004_auto_20191210_0011'),
        ('markssection', '0002_marks_examname'),
    ]

    operations = [
        migrations.CreateModel(
            name='AdditionalSubjectMapping',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subject', models.CharField(max_length=50)),
                ('marks', models.IntegerField(blank=True, null=True)),
                ('classroomStudent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='classform.ClassRoomStudent')),
                ('examName', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='markssection.Exam')),
                ('examType', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='markssection.ExamType')),
            ],
        ),
        migrations.DeleteModel(
            name='AdditionalSubject',
        ),
    ]