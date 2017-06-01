from .models import FsiMAllocDetails,FsiMAllocLeafSelection,FsiMAllocationRule
from .serializers import FsiMAllocDetailsSerializer , FsiMAllocLeafSelectionSerializer ,  FsiMAllocationRuleSerializer
from rest_framework import viewsets

class FsiMAllocDetailsViewSet(viewsets.ModelViewSet):
 
    serializer_class = FsiMAllocDetailsSerializer
    queryset = FsiMAllocDetails.objects.all()

class FsiMAllocLeafSelectionViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocLeafSelectionSerializer
    queryset = FsiMAllocLeafSelection.objects.all()

class FsiMAllocationRuleViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocationRuleSerializer
    queryset = FsiMAllocationRule.objects.all()