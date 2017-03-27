from .models import Member,Attribute
from .serializers import MemberSerializer,AttributeSerializer
from rest_framework import viewsets

class MemberViewSet(viewsets.ModelViewSet):
 
    serializer_class = MemberSerializer
    queryset = Member.objects.all()


class AttributeViewSet(viewsets.ModelViewSet):
 
    serializer_class = AttributeSerializer
    queryset = Attribute.objects.all()