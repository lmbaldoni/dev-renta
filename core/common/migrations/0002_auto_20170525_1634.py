# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-05-25 21:34
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('common', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='folder',
            options={'managed': True},
        ),
    ]