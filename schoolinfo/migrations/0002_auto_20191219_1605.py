# Generated by Django 2.2.5 on 2019-12-19 10:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schoolinfo', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schoolinfo',
            name='contactNumber',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='schoolinfo',
            name='latitude',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='schoolinfo',
            name='longitude',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='schoolinfo',
            name='schoolID',
            field=models.IntegerField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='schoolinfo',
            name='zipCode',
            field=models.IntegerField(),
        ),
    ]
