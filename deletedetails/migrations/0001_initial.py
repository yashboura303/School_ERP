# Generated by Django 2.2.5 on 2020-02-06 17:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='DeletedStudentInfo',
            fields=[
                ('firstName', models.CharField(blank=True, max_length=20)),
                ('lastName', models.CharField(blank=True, max_length=20)),
                ('fullName', models.CharField(blank=True, max_length=50)),
                ('gender', models.CharField(blank=True, max_length=20)),
                ('dob', models.DateField(blank=True, null=True)),
                ('classSection', models.CharField(blank=True, max_length=20)),
                ('admissionNumber', models.BigIntegerField(primary_key=True, serialize=False)),
                ('mobileNumber', models.BigIntegerField(blank=True, null=True)),
                ('religion', models.CharField(blank=True, max_length=20)),
                ('caste', models.CharField(blank=True, max_length=20)),
                ('tcNumber', models.BigIntegerField(blank=True, null=True)),
                ('aadharNumber', models.BigIntegerField(blank=True, null=True)),
                ('feeWaiverCategory', models.CharField(blank=True, max_length=20)),
                ('prevSchoolName', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedCurrentAddress',
            fields=[
                ('student', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='deletedetails.DeletedStudentInfo')),
                ('Address', models.CharField(blank=True, max_length=100)),
                ('Address1', models.CharField(blank=True, max_length=100)),
                ('Address2', models.CharField(blank=True, max_length=100)),
                ('zipCode', models.BigIntegerField(blank=True, null=True)),
                ('state', models.CharField(blank=True, max_length=20)),
                ('city', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedParentInfo',
            fields=[
                ('student', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, related_name='parent', serialize=False, to='deletedetails.DeletedStudentInfo')),
                ('fatherName', models.CharField(blank=True, max_length=20)),
                ('motherName', models.CharField(blank=True, max_length=20)),
                ('Fatherdob', models.DateField(blank=True, null=True)),
                ('Motherdob', models.DateField(blank=True, null=True)),
                ('MobileNumber', models.BigIntegerField(blank=True, null=True)),
                ('altMobileNumber', models.BigIntegerField(blank=True, null=True)),
                ('gaurdianQual', models.CharField(blank=True, max_length=30)),
                ('guardianOccup', models.CharField(blank=True, max_length=20)),
                ('email', models.CharField(blank=True, max_length=30)),
                ('motherQual', models.CharField(blank=True, max_length=30)),
                ('motherOccup', models.CharField(blank=True, max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='DeletedPermanentAddress',
            fields=[
                ('student', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='deletedetails.DeletedStudentInfo')),
                ('Address', models.CharField(blank=True, max_length=100)),
                ('Address1', models.CharField(blank=True, max_length=100)),
                ('Address2', models.CharField(blank=True, max_length=100)),
                ('zipCode', models.BigIntegerField(blank=True, null=True)),
                ('state', models.CharField(blank=True, max_length=20)),
                ('city', models.CharField(blank=True, max_length=20)),
            ],
        ),
    ]