# Generated by Django 2.2.5 on 2020-01-31 16:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('classform', '0007_auto_20200121_2327'),
    ]

    operations = [
        migrations.AlterField(
            model_name='classroom',
            name='teacher',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='employeeform.Teacher'),
        ),
    ]
