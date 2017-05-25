from .models import Folder
from .serializers import FolderSerializer
from rest_framework import viewsets

class FolderViewSet(viewsets.ModelViewSet):
 
    serializer_class = FolderSerializer
    queryset = Folder.objects.all()
