# Generated by Django 2.2.5 on 2019-12-04 19:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('form', '0008_currentaddress_city'),
    ]

    operations = [
        migrations.AddField(
            model_name='currentaddress',
            name='Address1',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='currentaddress',
            name='Address2',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='permanentaddress',
            name='Address1',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='permanentaddress',
            name='Address2',
            field=models.CharField(default='', max_length=100),
            preserve_default=False,
        ),
    ]
