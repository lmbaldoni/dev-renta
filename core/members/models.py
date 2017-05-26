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

    class Meta:
        managed = False
        db_table = 'DIM_PRODUCT_B'

class Attribute(models.Model):
    id = models.AutoField(primary_key=True)
    id_code = models.IntegerField(default=0)
    id_alfa = models.CharField(max_length=20, blank=True, default='')
    name = models.CharField(max_length=50, blank=True, default='')
    value = models.CharField(max_length=50, blank=True, default='')

    class Meta:
        managed = False
        db_table = 'DIM_PRODUCT_ATTR'

class Dimension(models.Model):
    dimension_name = models.CharField(max_length=100)
    member_b_table_name = models.CharField(max_length=30)
    member_tl_table_name = models.CharField(max_length=30)
    member_col = models.CharField(max_length=30)
    member_display_code_col = models.CharField(max_length=30)
    member_name_col = models.CharField(max_length=30)
    member_description_col = models.CharField(max_length=30)
    hierarchy_table_name = models.CharField(max_length=30)
    attribute_table_name = models.CharField(max_length=30)
    member_code_column = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'DIMENSIONS'    