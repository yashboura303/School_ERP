# Generated by Django 2.2.5 on 2019-12-19 07:50

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Thoughts',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('thought', models.TextField()),
                ('timestamp', models.DateField(blank=True)),
            ],
        ),
    ]
