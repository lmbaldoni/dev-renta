# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-26 03:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='batchs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('V_BATCH_ID', models.IntegerField(default=0)),
                ('V_BATCH_DESCRIPTION', models.CharField(blank=True, default='', max_length=100)),
                ('V_CREATED_BY', models.CharField(max_length=20)),
                ('V_CREATED_DATE', models.DateTimeField(auto_now_add=True)),
                ('V_LAST_MODIFIED_DATE', models.DateTimeField(auto_now_add=True)),
                ('V_LAST_MODIFIED_BY', models.CharField(max_length=20)),
                ('V_BATCH_TYPE', models.CharField(blank=True, default='', max_length=5)),
                ('V_SRC_FRAMEWORK', models.CharField(blank=True, default='', max_length=5)),
                ('V_DSN_NAME', models.CharField(blank=True, default='', max_length=50)),
                ('V_IS_SEQUENTIAL', models.CharField(blank=True, default='', max_length=5)),
            ],
            options={
                'ordering': ('V_BATCH_ID',),
            },
        ),
    ]
