from .models import Folder,Table
from .serializers import FolderSerializer,TableSerializer
from rest_framework import viewsets

class FolderViewSet(viewsets.ModelViewSet):
 
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()

class TableViewSet(viewsets.ModelViewSet):
     
    serializer_class = TableSerializer
    queryset = Table.objects.all()