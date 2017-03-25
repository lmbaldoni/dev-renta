from django.db import models

class Member(models.Model):
    id = models.AutoField(primary_key=True)
    id_code = models.IntegerField(default=0)
    id_alfa = models.CharField(max_length=20, blank=True, default='')
    name = models.CharField(max_length=20, blank=True, default='')
    description = models.CharField(max_length=100, blank=True, default='')
    enabled = models.BooleanField(default=False)
    if_lead = models.BooleanField(default=False)
    create_date = models.DateTimeField(auto_now_add=True)
    create_by = models.CharField(max_length=20)
    modified_date = models.DateTimeField(auto_now_add=True)
    modified_by = models.CharField(max_length=20)

    