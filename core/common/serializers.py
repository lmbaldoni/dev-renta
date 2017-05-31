from rest_framework import serializers
from .models import Folder , Table , Column

class FolderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Folder
        fields = (  'id',
                    'V_DSNID',
                    'V_SEGMENT_CODE',
                    'V_SEGMENT_NAME',
                    'V_SEGMENT_DESC',
                    )

class TableSerializer(serializers.ModelSerializer):
    class Meta:
        model = Table
        fields = (  'table_name',
                    'display_name',)

class ColumnSerializer(serializers.ModelSerializer):
    class Meta:
        model = Column
        fields = (  'display_name',
                    'column_name',
                    'table_name',)