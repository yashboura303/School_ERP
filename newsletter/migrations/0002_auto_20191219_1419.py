# Generated by Django 2.2.5 on 2019-12-19 08:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('newsletter', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='newsletter',
            name='description',
            field=models.TextField(default=''),
        ),
    ]