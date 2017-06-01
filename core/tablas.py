# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class DimProductAttr(models.Model):
    id_code = models.IntegerField()
    id_alfa = models.CharField(max_length=20)
    name = models.CharField(max_length=50)
    value = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'DIM_PRODUCT_ATTR'


class DimProductB(models.Model):
    id_code = models.IntegerField()
    id_alfa = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=100)
    enabled = models.BooleanField()
    if_lead = models.BooleanField()
    create_date = models.DateTimeField()
    create_by = models.CharField(max_length=20)
    modified_date = models.DateTimeField()
    modified_by = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'DIM_PRODUCT_B'


class SegFolder(models.Model):
    id = models.DecimalField(max_digits=65535, decimal_places=65535)
    v_dsnid = models.CharField(db_column='V_DSNID', max_length=25)  # Field name made lowercase.
    v_segment_code = models.CharField(db_column='V_SEGMENT_CODE', max_length=10, blank=True, null=True)  # Field name made lowercase.
    v_segment_name = models.CharField(db_column='V_SEGMENT_NAME', max_length=30, blank=True, null=True)  # Field name made lowercase.
    v_segment_desc = models.CharField(db_column='V_SEGMENT_DESC', max_length=100, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'SEG_FOLDER'
        unique_together = (('id', 'v_dsnid'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class BatchsBatch(models.Model):
    v_batch_id = models.IntegerField(db_column='V_BATCH_ID')  # Field name made lowercase.
    v_batch_description = models.CharField(db_column='V_BATCH_DESCRIPTION', max_length=100)  # Field name made lowercase.
    v_created_by = models.CharField(db_column='V_CREATED_BY', max_length=20)  # Field name made lowercase.
    v_created_date = models.DateTimeField(db_column='V_CREATED_DATE')  # Field name made lowercase.
    v_last_modified_date = models.DateTimeField(db_column='V_LAST_MODIFIED_DATE')  # Field name made lowercase.
    v_last_modified_by = models.CharField(db_column='V_LAST_MODIFIED_BY', max_length=20)  # Field name made lowercase.
    v_batch_type = models.CharField(db_column='V_BATCH_TYPE', max_length=5)  # Field name made lowercase.
    v_src_framework = models.CharField(db_column='V_SRC_FRAMEWORK', max_length=5)  # Field name made lowercase.
    v_dsn_name = models.CharField(db_column='V_DSN_NAME', max_length=50)  # Field name made lowercase.
    v_is_sequential = models.CharField(db_column='V_IS_SEQUENTIAL', max_length=5)  # Field name made lowercase.
    highlighted = models.TextField()
    owner = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'batchs_batch'


class BatchsParameter(models.Model):
    v_batch_id = models.IntegerField(db_column='V_BATCH_ID')  # Field name made lowercase.
    v_task_id = models.CharField(db_column='V_TASK_ID', max_length=20)  # Field name made lowercase.
    i_parameter_order = models.IntegerField(db_column='I_PARAMETER_ORDER')  # Field name made lowercase.
    v_parameter_name = models.CharField(db_column='V_PARAMETER_NAME', max_length=400)  # Field name made lowercase.
    v_parameter_value = models.CharField(db_column='V_PARAMETER_VALUE', max_length=400)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'batchs_parameter'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class FsiMAllocDetails(models.Model):
    alloc_element_sys_id = models.BigIntegerField()
    alloc_element_type = models.CharField(max_length=1)
    lookup_table_sys_id = models.BigIntegerField(blank=True, null=True)
    table_sys_id = models.BigIntegerField(blank=True, null=True)
    source_constant = models.DecimalField(max_digits=15, decimal_places=4, blank=True, null=True)
    leaf_selection_sys_id = models.BigIntegerField(blank=True, null=True)
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

    class Meta:
        managed = False
        db_table = 'fsi_m_alloc_details'
        unique_together = (('alloc_element_sys_id', 'alloc_element_type'),)


class FsiMAllocLeafSelection(models.Model):
    leaf_selection_sys_id = models.BigIntegerField()
    leaf_selection_flag = models.CharField(max_length=1, blank=True, null=True)
    leaf_num_id = models.IntegerField()
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


class FsiMAllocationRule(models.Model):
    allocation_sys_id = models.BigIntegerField(unique=True)
    allocation_type_cd = models.IntegerField(blank=True, null=True)
    source_sys_id = models.BigIntegerField(blank=True, null=True)
    factor_operator_type = models.CharField(max_length=1, blank=True, null=True)
    factor_operator_accr_basis = models.CharField(max_length=1, blank=True, null=True)
    factor_operator_constant = models.CharField(max_length=1, blank=True, null=True)
    factor_constant = models.FloatField(blank=True, null=True)
    factor_accrual_basis_cd = models.IntegerField(blank=True, null=True)
    allocation_operator = models.CharField(max_length=1, blank=True, null=True)
    driver_sys_id = models.BigIntegerField(blank=True, null=True)
    assignment_sys_id = models.BigIntegerField(blank=True, null=True)
    no_offset_flag = models.CharField(max_length=1, blank=True, null=True)
    offset_sys_id = models.BigIntegerField(blank=True, null=True)
    output_option_cd = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'fsi_m_allocation_rule'


class FsiMBatchMapping(models.Model):
    app_sequence_id = models.BigIntegerField()
    icc_batch_id = models.CharField(max_length=41)
    batch_type = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'fsi_m_batch_mapping'
        unique_together = (('app_sequence_id', 'icc_batch_id', 'batch_type'),)


class FsiMBatchTaskTypeB(models.Model):
    task_id = models.CharField(unique=True, max_length=20)

    class Meta:
        managed = False
        db_table = 'fsi_m_batch_task_type_b'


class FsiMBatchTaskTypeTl(models.Model):
    component_name = models.CharField(max_length=90)
    task_id = models.CharField(max_length=20)
    mls_cd = models.CharField(max_length=10)
    description = models.CharField(max_length=200)

    class Meta:
        managed = False
        db_table = 'fsi_m_batch_task_type_tl'
        unique_together = (('component_name', 'task_id', 'mls_cd'),)


class FsiMDataIdentityDetail(models.Model):
    identity_code = models.BigIntegerField()
    as_of_date = models.DateTimeField()
    row_count = models.BigIntegerField(blank=True, null=True)
    balance = models.DecimalField(max_digits=38, decimal_places=4, blank=True, null=True)
    balance_type_cd = models.IntegerField()
    parent_identity_code = models.BigIntegerField()
    src_drv_as_of_date = models.DateTimeField(blank=True, null=True)
    src_drv_type = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'fsi_m_data_identity_detail'
        unique_together = (('identity_code', 'as_of_date', 'balance_type_cd', 'parent_identity_code', 'src_drv_type'),)


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


class MembersAttribute(models.Model):
    id_code = models.IntegerField()
    id_alfa = models.CharField(max_length=20)
    name = models.CharField(max_length=50)
    value = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'members_attribute'


class MembersMember(models.Model):
    id_code = models.IntegerField()
    id_alfa = models.CharField(max_length=20)
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=100)
    enabled = models.BooleanField()
    if_lead = models.BooleanField()
    create_date = models.DateTimeField()
    create_by = models.CharField(max_length=20)
    modified_date = models.DateTimeField()
    modified_by = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'members_member'


class Prueba(models.Model):
    prueba = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'prueba'


class RevColumnProperties(models.Model):
    column_property_cd = models.ForeignKey('RevColumnPropertyCd', models.DO_NOTHING, db_column='column_property_cd')
    property_column = models.CharField(max_length=30, blank=True, null=True)
    protected_flg = models.SmallIntegerField()
    table_name = models.CharField(max_length=30)
    column_name = models.CharField(max_length=30)
    owner = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'rev_column_properties'
        unique_together = (('column_property_cd', 'table_name', 'column_name', 'owner'),)


class RevColumnPropertyCd(models.Model):
    column_property_cd = models.IntegerField(unique=True)
    currency_basis_flg = models.SmallIntegerField()
    fe_ui_setup_flg = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'rev_column_property_cd'


class RevColumnPropertyMls(models.Model):
    mls_cd = models.CharField(max_length=10)
    column_property_cd = models.ForeignKey(RevColumnPropertyCd, models.DO_NOTHING, db_column='column_property_cd')
    column_property = models.CharField(max_length=30)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_column_property_mls'
        unique_together = (('mls_cd', 'column_property_cd'),)


class RevDimAttributesTl(models.Model):
    dimension_id = models.BigIntegerField()
    attribute_id = models.BigIntegerField()
    attribute_name = models.CharField(max_length=80)
    description = models.CharField(max_length=255, blank=True, null=True)
    last_modified_by = models.CharField(max_length=20)
    last_modified_date = models.DateTimeField()
    created_by = models.CharField(max_length=20)
    creation_date = models.DateTimeField()
    language = models.CharField(max_length=4)
    source_lang = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_dim_attributes_tl'


class RevDimensionsB(models.Model):
    dimension_id = models.IntegerField()
    member_data_type_code = models.CharField(max_length=30)
    member_b_table_name = models.CharField(max_length=30)
    member_tl_table_name = models.CharField(max_length=30, blank=True, null=True)
    member_col = models.CharField(max_length=30)
    member_display_code_col = models.CharField(max_length=30)
    member_name_col = models.CharField(max_length=30)
    member_description_col = models.CharField(max_length=30)
    hierarchy_table_name = models.CharField(max_length=30, blank=True, null=True)
    attribute_table_name = models.CharField(max_length=30, blank=True, null=True)
    last_modified_by = models.CharField(max_length=20)
    last_modified_date = models.DateField()
    created_by = models.CharField(max_length=20)
    creation_date = models.DateField()
    definition_language = models.CharField(max_length=4)
    dimension_active_flag = models.CharField(max_length=1)
    dimension_type_code = models.CharField(max_length=30)
    simple_dimension_flag = models.CharField(max_length=1)
    user_defined_flag = models.CharField(max_length=1)
    write_flag = models.CharField(max_length=1, blank=True, null=True)
    dimension_editable_flag = models.CharField(max_length=1)
    key_dimension_flag = models.CharField(max_length=1)
    start_range = models.IntegerField(blank=True, null=True)
    member_code_column = models.CharField(max_length=30, blank=True, null=True)
    table_type = models.CharField(max_length=1, blank=True, null=True)
    flattened_table_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_dimensions_b'


class RevDimensionsTl(models.Model):
    dimension_id = models.IntegerField(primary_key=True)
    dimension_name = models.CharField(max_length=100)
    description = models.CharField(max_length=255, blank=True, null=True)
    last_modified_by = models.CharField(max_length=20)
    last_modified_date = models.DateField()
    created_by = models.CharField(max_length=20)
    creation_date = models.DateField()

    class Meta:
        managed = False
        db_table = 'rev_dimensions_tl'


class RevHierDefinitions(models.Model):
    hierarchy_id = models.BigIntegerField(unique=True)
    flattened_rows_completion_code = models.CharField(max_length=30, blank=True, null=True)
    created_by = models.CharField(max_length=30, blank=True, null=True)
    creation_date = models.DateTimeField(blank=True, null=True)
    last_modified_by = models.CharField(max_length=30, blank=True, null=True)
    last_modified_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_hier_definitions'


class RevHierarchies(models.Model):
    hierarchy_id = models.BigIntegerField(unique=True)
    dimension_id = models.BigIntegerField()
    hierarchy_type_code = models.CharField(max_length=30)
    multi_top_flag = models.CharField(max_length=1)
    hierarchy_usage_code = models.CharField(max_length=30)
    automatic_inheritance = models.CharField(max_length=1)
    show_member_code = models.CharField(max_length=1)
    init_display_level = models.SmallIntegerField(blank=True, null=True)
    orphan_branch = models.CharField(max_length=1)
    display_signage = models.CharField(max_length=1)
    maxlevels = models.SmallIntegerField(blank=True, null=True)
    last_modified_by = models.CharField(max_length=20)
    last_modified_date = models.DateTimeField()
    created_by = models.CharField(max_length=20)
    creation_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'rev_hierarchies'


class RevHierarchyFilter(models.Model):
    sys_id_num = models.BigIntegerField()
    hierarchy_sys_id = models.BigIntegerField()
    hierarchy_level = models.IntegerField()
    leaf_node = models.BigIntegerField()

    class Meta:
        managed = False
        db_table = 'rev_hierarchy_filter'
        unique_together = (('sys_id_num', 'hierarchy_sys_id', 'hierarchy_level', 'leaf_node'),)


class RevHierarchyLevels(models.Model):
    hierarchy_id = models.BigIntegerField()
    level_num = models.DecimalField(max_digits=22, decimal_places=0)
    level_name = models.CharField(max_length=150)
    level_description = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'rev_hierarchy_levels'
        unique_together = (('hierarchy_id', 'level_num'), ('hierarchy_id', 'level_name'),)


class RevTabColumns(models.Model):
    table_name = models.ForeignKey('RevTablesB', models.DO_NOTHING, db_column='table_name')
    column_name = models.CharField(max_length=30)
    owner = models.CharField(max_length=30)
    display_flg = models.SmallIntegerField()
    rev_data_type_cd = models.IntegerField()
    dbf_name = models.CharField(max_length=10, blank=True, null=True)
    data_type = models.CharField(max_length=20, blank=True, null=True)
    logical_data_type = models.CharField(max_length=20, blank=True, null=True)
    data_type_size = models.CharField(max_length=20, blank=True, null=True)
    data_precision = models.CharField(max_length=10, blank=True, null=True)
    data_scale = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_tab_columns'
        unique_together = (('table_name', 'owner', 'column_name'),)


class RevTabColumnsMls(models.Model):
    mls_cd = models.CharField(max_length=10)
    display_name = models.CharField(max_length=1024)
    description = models.CharField(max_length=4000, blank=True, null=True)
    table_name = models.CharField(max_length=30)
    column_name = models.CharField(max_length=30)
    owner = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'rev_tab_columns_mls'
        unique_together = (('mls_cd', 'table_name', 'owner', 'column_name'),)


class RevTableClassAssignment(models.Model):
    table_name = models.ForeignKey('RevTablesB', models.DO_NOTHING, db_column='table_name')
    owner = models.CharField(max_length=30)
    table_classification_cd = models.ForeignKey('RevTableClassificationB', models.DO_NOTHING, db_column='table_classification_cd')
    protected_flg = models.SmallIntegerField()
    validated_flag = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'rev_table_class_assignment'
        unique_together = (('table_name', 'owner', 'table_classification_cd'),)


class RevTableClassProperties(models.Model):
    table_classification_cd = models.ForeignKey('RevTableClassificationB', models.DO_NOTHING, db_column='table_classification_cd')
    table_property_cd = models.ForeignKey('RevTableProperties', models.DO_NOTHING, db_column='table_property_cd')

    class Meta:
        managed = False
        db_table = 'rev_table_class_properties'
        unique_together = (('table_classification_cd', 'table_property_cd'),)


class RevTableClassificationB(models.Model):
    table_classification_cd = models.IntegerField(unique=True)
    user_assign_flg = models.SmallIntegerField()
    dynamic_priv_flg = models.SmallIntegerField()
    classification_flg = models.SmallIntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_table_classification_b'


class RevTableClassificationTl(models.Model):
    language = models.CharField(max_length=10)
    table_classification_cd = models.ForeignKey(RevTableClassificationB, models.DO_NOTHING, db_column='table_classification_cd')
    table_classification = models.CharField(max_length=100)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_table_classification_tl'
        unique_together = (('language', 'table_classification_cd'),)


class RevTableProperties(models.Model):
    table_property_cd = models.IntegerField(unique=True)
    table_property = models.CharField(max_length=30)
    description = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_table_properties'


class RevTablesB(models.Model):
    table_name = models.CharField(max_length=30)
    owner = models.CharField(max_length=30)
    display_flg = models.SmallIntegerField()
    dbf_name = models.CharField(max_length=10, blank=True, null=True)
    tablespace_name = models.CharField(max_length=30, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_tables_b'
        unique_together = (('table_name', 'owner'),)


class RevTablesTl(models.Model):
    mls_cd = models.CharField(max_length=10)
    table_name = models.ForeignKey(RevTablesB, models.DO_NOTHING, db_column='table_name')
    owner = models.CharField(max_length=30)
    display_name = models.CharField(max_length=1024)
    description = models.CharField(max_length=4000, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rev_tables_tl'
        unique_together = (('mls_cd', 'table_name', 'owner'),)
