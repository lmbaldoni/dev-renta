# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-26 02:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('members', '0002_auto_20170226_0233'),
    ]

    operations = [
        migrations.AlterField(
            model_name='members',
            name='create_by',
            field=models.CharField(max_length=20),
        ),
    ]
