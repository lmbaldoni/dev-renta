#from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets
from .models import member,attribute
from .serializers import MemberSerializer

class MemberViewSet(viewsets.ModelViewSet):
    queryset = member.objects.all()
    serializer_class = MemberSerializer


class AttributeViewSet(viewsets.ModelViewSet):
    queryset = attribute.objects.all()
    serializer_class = AttributeSerializer