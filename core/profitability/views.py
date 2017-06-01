from django.shortcuts import render
from rest_framework import viewsets
from .models import FsiMAllocDetails , FsiMAllocLeafSelection , FsiMAllocationRule
from .serializers import FsiMAllocDetailsSerializer , FsiMAllocLeafSelectionSerializer ,  FsiMAllocationRuleSerializer

class FsiMAllocDetailsViewSet(viewsets.ModelViewSet):
    queryset = FsiMAllocDetails.objects.all()
    serializer_class = FsiMAllocDetailsSerializer

class FsiMAllocLeafSelectionViewSet(viewsets.ModelViewSet):
    queryset = FsiMAllocLeafSelection.objects.all()
    serializer_class = FsiMAllocLeafSelectionSerializer

class FsiMAllocationRuleViewSet(viewsets.ModelViewSet):
    queryset = FsiMAllocationRule.objects.all()
    serializer_class = FsiMAllocationRuleSerializer