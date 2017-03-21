from rest_framework import serializers
from .models import Member

class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = (  'id_code',
                    'id_alfa',
                    'name',
                    'description',
                    'enabled',
                    'if_lead',
                    'create_date',
                    'create_by',
                    'modified_date',
                    'modified_by',)