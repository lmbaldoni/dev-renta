# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-05-25 23:10
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('common', '0002_auto_20170525_1634'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='folder',
            options={'managed': False},
        ),
    ]
