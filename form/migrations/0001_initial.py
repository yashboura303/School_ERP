# Generated by Django 2.2.5 on 2019-12-03 09:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='StudentInfo',
            fields=[
                ('attributes', models.CharField(max_length=50)),
                ('firstName', models.CharField(max_length=20)),
                ('lastName', models.CharField(max_length=20)),
                ('gender', models.CharField(max_length=20)),
                ('dob', models.DateField(null=True)),
                ('classSection', models.CharField(max_length=20)),
                ('admissionNumber', models.BigIntegerField(default=0, primary_key=True, serialize=False)),
                ('permanentAddress', models.CharField(max_length=80)),
                ('mobileNumber', models.BigIntegerField(default=0)),
                ('religion', models.CharField(max_length=20)),
                ('caste', models.CharField(max_length=20)),
                ('tcNumber', models.BigIntegerField(default=0)),
                ('aadharNumber', models.BigIntegerField(default=0)),
                ('feeWaiverCategory', models.CharField(max_length=20)),
                ('siblingID', models.BigIntegerField(default=0)),
                ('prevSchoolName', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='CurrentAddress',
            fields=[
                ('admissionNumber', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='form.StudentInfo')),
                ('Address', models.CharField(max_length=100)),
                ('zipCode', models.BigIntegerField(default=0)),
                ('state', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='Documents',
            fields=[
                ('admissionNumber', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='form.StudentInfo')),
                ('photograph', models.FileField(upload_to='uploads/photograph')),
                ('idProof', models.FileField(upload_to='uploads/idProof')),
                ('castCertificate', models.FileField(upload_to='uploads/castCertificate')),
                ('domicile', models.FileField(upload_to='uploads/domicile')),
                ('tc', models.FileField(upload_to='uploads/tc')),
                ('characterCertificate', models.FileField(upload_to='uploads/characterCertificate')),
            ],
        ),
        migrations.CreateModel(
            name='ParentInfo',
            fields=[
                ('admissionNumber', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='form.StudentInfo')),
                ('attributes', models.CharField(max_length=50)),
                ('fatherName', models.CharField(max_length=20)),
                ('motherName', models.CharField(max_length=20)),
                ('Fatherdob', models.DateField(null=True)),
                ('Motherdob', models.DateField(null=True)),
                ('MobileNumber', models.BigIntegerField(default=0)),
                ('altMobileNumber', models.BigIntegerField(default=0)),
                ('gaurdianName', models.CharField(max_length=30)),
                ('gaurdianQual', models.CharField(max_length=30)),
                ('guardianOccup', models.CharField(max_length=20)),
                ('email', models.CharField(max_length=30)),
                ('motherQual', models.CharField(max_length=30)),
                ('motherOccup', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='PermanentAddress',
            fields=[
                ('admissionNumber', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='form.StudentInfo')),
                ('Address', models.CharField(max_length=100)),
                ('zipCode', models.BigIntegerField(default=0)),
                ('state', models.CharField(max_length=20)),
                ('city', models.CharField(max_length=20)),
            ],
        ),
    ]
