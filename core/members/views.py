#from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets
from .models import member
from .serializers import MemberSerializer

class MemberViewSet(viewsets.ModelViewSet):
    queryset = member.objects.all()
    serializer_class = MemberSerializer