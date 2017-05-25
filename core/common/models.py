from django.db import models

# Create your models here.

class Folder(models.Model):
    id = models.AutoField(primary_key=True)
    V_DSNID = models.CharField(max_length=25, blank=True, default='')
    V_SEGMENT_CODE = models.CharField(max_length=10, blank=True, default='')
    V_SEGMENT_NAME = models.CharField(max_length=30, blank=True, default='')
    V_SEGMENT_DESC = models.CharField(max_length=100, blank=True, default='')
    
    class Meta:
        managed = False
        db_table = 'SEG_FOLDER'
