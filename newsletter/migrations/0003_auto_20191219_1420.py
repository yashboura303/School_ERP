# Generated by Django 2.2.5 on 2019-12-19 08:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('newsletter', '0002_auto_20191219_1419'),
    ]

    operations = [
        migrations.AlterField(
            model_name='newsletter',
            name='description',
            field=models.TextField(null=True),
        ),
    ]