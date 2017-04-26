from rest_framework import serializers
from .models import Member,Attribute,Dimension

class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = (  'id',
                    'id_code',
                    'id_alfa',
                    'name',
                    'description',
                    'enabled',
                    'if_lead',
                    'create_date',
                    'create_by',
                    'modified_date',
                    'modified_by',)


class AttributeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attribute
        fields = (  'id',
                    'id_code',
                    'id_alfa',
                    'name',
                    'value',)

class DimensionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dimension
        fields = (  'dimension_name',
                    'member_b_table_name',
                    'member_tl_table_name',
                    'member_col',
                    'member_display_code_col',
                    'member_name_col',
                    'hierarchy_table_name',
                    'attribute_table_name',
                    'member_code_column',)