from batchs.models import batch
from batchs.serializers import BatchSerializer
from batchs.serializers import UserSerializer
from rest_framework import generics
from django.contrib.auth.models import User
from rest_framework import permissions
from batchs.permissions import IsOwnerOrReadOnly



class BatchList(generics.ListCreateAPIView):
    queryset = batch.objects.all()
    serializer_class = BatchSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)
    #sobreesribo el metodo para agregarle el usuario
    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class BatchDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = batch.objects.all()
    serializer_class = BatchSerializer 
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,IsOwnerOrReadOnly,)


class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer