from rest_framework import serializers
from .models import FsiMAllocDetails , FsiMAllocLeafSelection , FsiMAllocationRule,Album,Track

class FsiMAllocLeafSelectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = FsiMAllocLeafSelection
        fields = (  'leaf_selection_sys_id',
                    'leaf_selection_flag',
                    'leaf_num_id',
                    'leaf_node',
                    'hierarchy_sys_id',
                    'hierarchy_level',
                    'tree_filter_sys_id',
                    'alloc_dim_subtype_cd',
                    'dimension_currency_value',
                    'leaf_code',
                    'hier_type',
                    'hier_code',)

class FsiMAllocDetailsSerializer(serializers.ModelSerializer):
    leafs = FsiMAllocLeafSelectionSerializer(many=True)
    
    class Meta:
        model = FsiMAllocDetails
        fields = (  'alloc_element_sys_id',
                    'alloc_element_type',
                    'lookup_table_sys_id',
                    'table_sys_id',
                    'source_constant',
                    # 'leaf_selection_sys_id',
                    'table_name',
                    'column_type',
                    'column_name',
                    'formula_sys_id',
                    'filter_type',
                    'filter_sys_id',
                    'aggregate_to_ledger',
                    'balance_type_cd',
                    'allocation_type_cd',
                    'percent_driver_type',
                    'scenario_cd',
                    'leafs')
     
    #  def create(self, validated_data):
    #         leafs_data = validated_data.pop('leafs')
    #     fsiMAllocDetails = FsiMAllocDetails.objects.create(**validated_data)
    #     for leaf_data in leafs_data:
    #         FsiMAllocLeafSelection.objects.create(leaf_selection_sys=fsiMAllocDetails, **leaf_data)
    #     return fsiMAllocDetails

class FsiMAllocationRuleSerializer(serializers.ModelSerializer):
    class Meta:
        model = FsiMAllocationRule
        fields = (  'allocation_sys_id',
                    'allocation_type_cd',
                    'source_sys_id',
                    'factor_operator_type',
                    'factor_operator_accr_basis',
                    'factor_operator_constant',
                    'factor_constant',
                    'factor_accrual_basis_cd',
                    'allocation_operator',
                    'driver_sys_id',
                    'assignment_sys_id',
                    'no_offset_flag',
                    'offset_sys_id',
                    'output_option_cd')

class TrackSerializer(serializers.ModelSerializer):
    class Meta:
        model = Track
        fields = ('order', 'title', 'duration')

class AlbumSerializer(serializers.ModelSerializer):
    tracks = TrackSerializer(many=True)

    class Meta:
        model = Album
        fields = ('album_name', 'artist', 'tracks')

    def create(self, validated_data):
        tracks_data = validated_data.pop('tracks')
        album = Album.objects.create(**validated_data)
        for track_data in tracks_data:
            Track.objects.create(album=album, **track_data)
        return album