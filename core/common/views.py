from django.shortcuts import render
from rest_framework import viewsets
from .models import Folder
from .serializers import FolderSerializer

class FolderViewSet(viewsets.ModelViewSet):
    queryset = folder.objects.all()
    serializer_class = FolderSerializer
