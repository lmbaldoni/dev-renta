from .models import FsiMAllocDetails,FsiMAllocLeafSelection,FsiMAllocationRule,Album,Track
from .serializers import FsiMAllocDetailsSerializer , FsiMAllocLeafSelectionSerializer ,  FsiMAllocationRuleSerializer
from rest_framework import viewsets
from .serializers import AlbumSerializer,TrackSerializer

class FsiMAllocDetailsViewSet(viewsets.ModelViewSet):
 
    serializer_class = FsiMAllocDetailsSerializer
    queryset = FsiMAllocDetails.objects.all()

class FsiMAllocLeafSelectionViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocLeafSelectionSerializer
    queryset = FsiMAllocLeafSelection.objects.all()

class FsiMAllocationRuleViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocationRuleSerializer
    queryset = FsiMAllocationRule.objects.all()

class TrackViewSet(viewsets.ModelViewSet):
    
    serializer_class = TrackSerializer
    queryset = Track.objects.all()

class AlbumSerializerViewSet(viewsets.ModelViewSet):
    
    serializer_class = AlbumSerializer
    queryset = Album.objects.all()