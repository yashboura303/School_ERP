# Generated by Django 2.2.5 on 2020-01-29 18:55

from django.db import migrations, models
import django.db.models.deletion
import employeeform.models


class Migration(migrations.Migration):

    dependencies = [
        ('employeeform', '0005_auto_20191209_1730'),
    ]

    operations = [
        migrations.AlterField(
            model_name='currentaddress',
            name='Address',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='Address1',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='Address2',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='city',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='employee',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='employeeform.Employee'),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='state',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='bloodGroup',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='currentAddress',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='employee',
            name='dob',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='employee',
            name='empCategory',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='experience',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='father_name',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='employee',
            name='firstName',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='fullName',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='employee',
            name='joiningDate',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='employee',
            name='lastName',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='marital_status',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='employee',
            name='mother_name',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='employee',
            name='partnerName',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='employee',
            name='permanentAddress',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='IdProof',
            field=models.FileField(blank=True, upload_to=employeeform.models.user_directory_path),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='addressProof',
            field=models.FileField(blank=True, upload_to=employeeform.models.user_directory_path),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='employee',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='employeeform.Employee'),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='otherDoc',
            field=models.FileField(blank=True, upload_to=employeeform.models.user_directory_path),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='photo',
            field=models.FileField(blank=True, upload_to=employeeform.models.user_directory_path),
        ),
        migrations.AlterField(
            model_name='employeedocuments',
            name='qualificationDoc',
            field=models.FileField(blank=True, upload_to=employeeform.models.user_directory_path),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address1',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address2',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='city',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='employee',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='employeeform.Employee'),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='state',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='classTeacher',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='designation',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='employee',
            field=models.OneToOneField(blank=True, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='employeeform.Employee'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='firstName',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='fullName',
            field=models.CharField(blank=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='lastName',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='specialization',
            field=models.CharField(blank=True, max_length=50),
        ),
    ]
