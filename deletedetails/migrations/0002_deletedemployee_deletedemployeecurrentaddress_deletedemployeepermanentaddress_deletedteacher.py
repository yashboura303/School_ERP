# Generated by Django 2.2.5 on 2020-02-06 18:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('deletedetails', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='DeletedEmployee',
            fields=[
                ('empID', models.IntegerField(default=0, primary_key=True, serialize=False)),
                ('firstName', models.CharField(blank=True, max_length=20)),
                ('lastName', models.CharField(blank=True, max_length=20)),
                ('fullName', models.CharField(blank=True, max_length=50)),
                ('father_name', models.CharField(blank=True, max_length=50)),
                ('mother_name', models.CharField(blank=True, max_length=50)),
                ('partnerName', models.CharField(blank=True, max_length=50)),
                ('gender', models.CharField(blank=True, max_length=20)),
                ('email', models.CharField(blank=True, max_length=40)),
                ('dob', models.DateField(blank=True, null=True)),
                ('joiningDate', models.DateField(blank=True, null=True)),
                ('bloodGroup', models.CharField(blank=True, max_length=20)),
                ('mobile_number', models.BigIntegerField(default=0)),
                ('marital_status', models.CharField(blank=True, max_length=20)),
                ('experience', models.CharField(blank=True, max_length=20)),
                ('aadharNumber', models.BigIntegerField(default=0)),
                ('empCategory', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedEmployeeCurrentAddress',
            fields=[
                ('employee', models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='deletedetails.DeletedEmployee')),
                ('Address', models.CharField(blank=True, max_length=100)),
                ('Address1', models.CharField(blank=True, max_length=100)),
                ('Address2', models.CharField(blank=True, max_length=100)),
                ('zipCode', models.BigIntegerField(default=0)),
                ('state', models.CharField(blank=True, max_length=20)),
                ('city', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedEmployeePermanentAddress',
            fields=[
                ('employee', models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='deletedetails.DeletedEmployee')),
                ('Address', models.CharField(blank=True, max_length=100)),
                ('Address1', models.CharField(blank=True, max_length=100)),
                ('Address2', models.CharField(blank=True, max_length=100)),
                ('zipCode', models.BigIntegerField(default=0)),
                ('state', models.CharField(blank=True, max_length=20)),
                ('city', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedTeacher',
            fields=[
                ('employee', models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='deletedetails.DeletedEmployee')),
                ('specialization', models.CharField(blank=True, max_length=50)),
                ('designation', models.CharField(blank=True, max_length=50)),
                ('classTeacher', models.CharField(blank=True, max_length=50)),
            ],
        ),
    ]