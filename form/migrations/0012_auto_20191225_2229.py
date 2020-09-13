# Generated by Django 2.2.5 on 2019-12-25 16:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('form', '0011_remove_parentinfo_gaurdianname'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='studentinfo',
            name='fName',
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='Address',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='Address1',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='Address2',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='city',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='state',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='currentaddress',
            name='zipCode',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='Fatherdob',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='MobileNumber',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='Motherdob',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='altMobileNumber',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='email',
            field=models.CharField(blank=True, default='', max_length=30),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='fatherName',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='gaurdianQual',
            field=models.CharField(blank=True, default='', max_length=30),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='guardianOccup',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='motherName',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='motherOccup',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='parentinfo',
            name='motherQual',
            field=models.CharField(blank=True, default='', max_length=30),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address1',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='Address2',
            field=models.CharField(blank=True, default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='city',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='state',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='permanentaddress',
            name='zipCode',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='aadharNumber',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='caste',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='classSection',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='dob',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='feeWaiverCategory',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='firstName',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='fullName',
            field=models.CharField(blank=True, default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='gender',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='lastName',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='mobileNumber',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='prevSchoolName',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='religion',
            field=models.CharField(blank=True, default='', max_length=20),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='siblingID',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='studentinfo',
            name='tcNumber',
            field=models.BigIntegerField(blank=True, default=0, null=True),
        ),
    ]
