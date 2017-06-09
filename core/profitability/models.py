from django.db import models



# Create your models here.
class FsiMAllocLeafSelection(models.Model):
    leaf_selection_sys_id = models.BigIntegerField(primary_key=True)
    #leaf = models.ForeignKey(FsiMAllocDetails, related_name='leafs', on_delete=models.CASCADE)
    leaf_selection_flag = models.CharField(max_length=1, blank=True, null=True)
    leaf_num_id = models.IntegerField(primary_key=True)
    leaf_node = models.BigIntegerField(blank=True, null=True)
    hierarchy_sys_id = models.BigIntegerField(blank=True, null=True)
    hierarchy_level = models.IntegerField(blank=True, null=True)
    tree_filter_sys_id = models.BigIntegerField(blank=True, null=True)
    alloc_dim_subtype_cd = models.IntegerField(blank=True, null=True)
    dimension_currency_value = models.CharField(max_length=30, blank=True, null=True)
    leaf_code = models.CharField(max_length=30, blank=True, null=True)
    hier_type = models.CharField(max_length=2, blank=True, null=True)
    hier_code = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_m_alloc_leaf_selection'
        unique_together = (('leaf_selection_sys_id', 'leaf_num_id'),)
    
class FsiMAllocDetails(models.Model):
    alloc_element_sys_id = models.BigIntegerField(primary_key=True)
    #alloc_element_type = models.CharField(max_length=1,primary_key=True)
    alloc_element_type = models.CharField(max_length=1,primary_key=True)
    lookup_table_sys_id = models.BigIntegerField(blank=True, null=True)
    table_sys_id = models.BigIntegerField(blank=True, null=True)
    source_constant = models.DecimalField(max_digits=15, decimal_places=4, blank=True, null=True)
    #leaf_selection_sys_id = models.BigIntegerField(blank=True, null=True)
    leaf_selection_sys = models.ForeignKey(FsiMAllocLeafSelection, related_name='leafs', on_delete=models.CASCADE)
    #leaf_selection_sys_id = models.ManyToManyField(FsiMAllocLeafSelection)
    table_name = models.CharField(max_length=30, blank=True, null=True)
    column_type = models.CharField(max_length=1, blank=True, null=True)
    column_name = models.CharField(max_length=30, blank=True, null=True)
    formula_sys_id = models.BigIntegerField(blank=True, null=True)
    filter_type = models.CharField(max_length=1, blank=True, null=True)
    filter_sys_id = models.BigIntegerField(blank=True, null=True)
    aggregate_to_ledger = models.CharField(max_length=1, blank=True, null=True)
    balance_type_cd = models.IntegerField(blank=True, null=True)
    allocation_type_cd = models.IntegerField(blank=True, null=True)
    percent_driver_type = models.CharField(max_length=1, blank=True, null=True)
    scenario_cd = models.SmallIntegerField(blank=True, null=True)
    #leaf_selection_sys = models.ForeignKey(FsiMAllocLeafSelection, related_name='dimensions', on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'fsi_m_alloc_details'
        unique_together = (('alloc_element_sys_id', 'alloc_element_type'),)


class FsiMAllocationRule(models.Model):
    allocation_sys_id = models.BigIntegerField(unique=True,primary_key=True)
    allocation_type_cd = models.IntegerField(blank=True, null=True)
    #source_sys_id = models.BigIntegerField(blank=True, null=True)
    #source_sys = models.OneToOneField(FsiMAllocDetails)
    source_sys = models.ForeignKey(FsiMAllocDetails, related_name='sources', on_delete=models.CASCADE)
    factor_operator_type = models.CharField(max_length=1, blank=True, null=True)
    factor_operator_accr_basis = models.CharField(max_length=1, blank=True, null=True)
    factor_operator_constant = models.CharField(max_length=1, blank=True, null=True)
    factor_constant = models.FloatField(blank=True, null=True)
    factor_accrual_basis_cd = models.IntegerField(blank=True, null=True)
    allocation_operator = models.CharField(max_length=1, blank=True, null=True)
    #driver_sys_id = models.BigIntegerField(blank=True, null=True)
    driver_sys = models.ForeignKey(FsiMAllocDetails, related_name='drivers', on_delete=models.CASCADE)
    #driver_sys = models.OneToOneField(FsiMAllocDetails)
    #assignment_sys = models.OneToOneField(FsiMAllocDetails)
    #assignment_sys_id = models.BigIntegerField(blank=True, null=True)
    assignment_sys = models.ForeignKey(FsiMAllocDetails, related_name='debits', on_delete=models.CASCADE)
    no_offset_flag = models.CharField(max_length=1, blank=True, null=True)
    #offset_sys = models.OneToOneField(FsiMAllocDetails)
    #offset_sys_id = models.BigIntegerField(blank=True, null=True)
    offset_sys = models.ForeignKey(FsiMAllocDetails, related_name='credits', on_delete=models.CASCADE)
    output_option_cd = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_m_allocation_rule'

class Album(models.Model):
    album_name = models.CharField(max_length=100)
    artist = models.CharField(max_length=100)

class Track(models.Model):
    album = models.ForeignKey(Album, related_name='tracks', on_delete=models.CASCADE)
    order = models.IntegerField()
    title = models.CharField(max_length=100)
    duration = models.IntegerField()

    class Meta:
        unique_together = ('album', 'order')
        ordering = ['order']

    def __unicode__(self):
        return '%d: %s' % (self.order, self.title)


from django.contrib.auth.models import User
#from django.db import models


class UserProfile(models.Model):
    user = models.OneToOneField(User, primary_key=True)
    karma = models.IntegerField(default=0, blank=True)
    def __str__(self):
        return self.user.username

class Post(models.Model):
    owner = models.ForeignKey(UserProfile)
    title = models.CharField(max_length=100)
    body = models.TextField()
    def __str__(self):
        return self.title

class Comment(models.Model):
    owner = models.ForeignKey(UserProfile)
    post = models.ForeignKey(Post)
    text = models.CharField(max_length=300)
    def __str__(self):
        return self.text