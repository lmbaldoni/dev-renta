from .models import Folder,Table , Column
from .serializers import FolderSerializer,TableSerializer,ColumnSerializer
from rest_framework import viewsets

class FolderViewSet(viewsets.ModelViewSet):
 
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()

class TableViewSet(viewsets.ModelViewSet):
     
    serializer_class = TableSerializer
    queryset = Table.objects.all()

class ColumnViewSet(viewsets.ModelViewSet):
     
    serializer_class = ColumnSerializer
    queryset = Column.objects.all()