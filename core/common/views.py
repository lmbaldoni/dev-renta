from django.shortcuts import render
from rest_framework import viewsets
from .models import Folder , Table , Column
from .serializers import FolderSerializer , TableSerializer ,  ColumnSerializer

class FolderViewSet(viewsets.ModelViewSet):
    queryset = folder.objects.all()
    serializer_class = FolderSerializer

class TableViewSet(viewsets.ModelViewSet):
    queryset = table.objects.all()
    serializer_class = TableSerializer

class ColumnViewSet(viewsets.ModelViewSet):
    queryset = column.objects.all()
    serializer_class = ColumnSerializer