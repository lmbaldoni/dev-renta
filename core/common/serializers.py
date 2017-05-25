from rest_framework import serializers
from .models import Folder

class FolderSerializer(serializers.ModelSerializer):
    class Meta:
        model = Folder
        fields = (  'id',
                    'V_DSNID',
                    'V_SEGMENT_CODE',
                    'V_SEGMENT_NAME',
                    'V_SEGMENT_DESC',
                    )
