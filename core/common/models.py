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

class Column(models.Model):
    display_name = models.CharField(max_length=100)
    column_name = models.CharField(max_length=30,primary_key=True)
    table_name = models.CharField(max_length=30,primary_key=True)
   
    class Meta:
        managed = False
        db_table = 'COLUMNS'

class FsiMObjectDefinitionB(models.Model):
    object_definition_id = models.BigIntegerField(unique=True)
    object_origin_app_cd = models.CharField(max_length=30)
    leaf_num_id = models.IntegerField()
    id_type = models.SmallIntegerField()
    table_name = models.CharField(max_length=30)
    folder_id = models.BigIntegerField(blank=True, null=True)
    folder_name = models.CharField(max_length=30, blank=True, null=True)
    access_cd = models.CharField(max_length=1, blank=True, null=True)
    appl_name = models.CharField(max_length=10)
    deleted_flag = models.CharField(max_length=1, blank=True, null=True)
    source_lang = models.CharField(max_length=10, blank=True, null=True)
    created_by = models.CharField(max_length=30)
    creation_date = models.DateTimeField()
    modified_by = models.CharField(max_length=30, blank=True, null=True)
    last_modified_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_m_object_definition_b'


class FsiMObjectDefinitionTl(models.Model):
    object_definition_id = models.BigIntegerField()
    short_desc = models.CharField(max_length=60)
    long_desc = models.CharField(max_length=300, blank=True, null=True)
    lang_cd = models.CharField(max_length=10)
    created_by = models.CharField(max_length=30)
    creation_date = models.DateTimeField()
    modified_by = models.CharField(max_length=30, blank=True, null=True)
    last_modified_date = models.DateTimeField(blank=True, null=True)
    source_lang = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_m_object_definition_tl'
        unique_together = (('object_definition_id', 'lang_cd'),)


class FsiMessageLog(models.Model):
    process_id = models.BigIntegerField()
    sequences = models.BigIntegerField()
    msg_timestamp = models.DateTimeField()
    message_cd = models.IntegerField()
    msg_severity_cd = models.IntegerField(blank=True, null=True)
    batch_run_id = models.CharField(max_length=75, blank=True, null=True)
    context_specific_text = models.CharField(max_length=2000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_message_log'