# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-06-08 17:09
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('profitability', '0010_remove_userprofile_user2'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='album',
            name='id',
        ),
        migrations.AddField(
            model_name='album',
            name='album_id',
            field=models.IntegerField(default=1, primary_key=True, serialize=False),
            preserve_default=False,
        ),
    ]
