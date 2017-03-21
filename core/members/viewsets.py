from .models import Member
from .serializers import MemberSerializer
from rest_framework import viewsets

class MemberViewSet(viewsets.ModelViewSet):
 
    serializer_class = MemberSerializer
    queryset = Member.objects.all()