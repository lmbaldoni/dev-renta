from rest_framework import serializers
from .models import Member,Attribute

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