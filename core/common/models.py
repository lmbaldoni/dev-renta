from django.db import models

# Create your models here.

class Folder(models.Model):
    id = models.AutoField(primary_key=True)
    V_DSNID = models.CharField(max_length=25, default='')
    V_SEGMENT_CODE = models.CharField(max_length=10, default='')
    V_SEGMENT_NAME = models.CharField(max_length=30, default='')
    V_SEGMENT_DESC = models.CharField(max_length=100, default='')
    
    class Meta:
        managed = False
        db_table = 'SEG_FOLDER'

class Table(models.Model):
    table_name = models.CharField(max_length=30,blank=False)
    display_name = models.CharField(max_length=100,blank=False)
   
    class Meta:
        managed = False
        db_table = 'TABLES'