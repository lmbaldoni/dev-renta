from .models import Member,Attribute,Dimension
from .serializers import MemberSerializer,AttributeSerializer,DimensionSerializer
from rest_framework import viewsets

class MemberViewSet(viewsets.ModelViewSet):
 
    serializer_class = MemberSerializer
    queryset = Member.objects.all()


class AttributeViewSet(viewsets.ModelViewSet):
 
    serializer_class = AttributeSerializer
    queryset = Attribute.objects.all()

class DimensionViewSet(viewsets.ModelViewSet):
     
    serializer_class = DimensionSerializer
    queryset = Dimension.objects.all()