from rest_framework import serializers
from batchs.models import batch


class BatchSerializer(serializers.ModelSerializer):
    class Meta:
        model = batch
        fields = ('V_BATCH_ID','V_BATCH_DESCRIPTION','V_CREATED_BY','V_CREATED_DATE','V_LAST_MODIFIED_DATE','V_LAST_MODIFIED_BY',
        'V_BATCH_TYPE','V_SRC_FRAMEWORK','V_DSN_NAME','V_IS_SEQUENTIAL')
    

        