# Generated by Django 2.2.8 on 2019-12-24 12:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('guidance_emu', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GuidanceSendsearchLog',
            fields=[
                ('id', models.BigAutoField(primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'guidance_sendsearch_log',
                'managed': False,
            },
        ),
    ]