from django.shortcuts import render
from rest_framework import viewsets
from .models import Folder , Table
from .serializers import FolderSerializer , TableSerializer

class FolderViewSet(viewsets.ModelViewSet):
    queryset = folder.objects.all()
    serializer_class = FolderSerializer

class TableViewSet(viewsets.ModelViewSet):
    queryset = table.objects.all()
    serializer_class = TableSerializer