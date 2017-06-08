from .models import FsiMAllocDetails,FsiMAllocLeafSelection,FsiMAllocationRule,Album,Track
from .serializers import FsiMAllocDetailsSerializer , FsiMAllocLeafSelectionSerializer ,  FsiMAllocationRuleSerializer
from rest_framework import viewsets
from .serializers import AlbumSerializer,TrackSerializer

class FsiMAllocDetailsViewSet(viewsets.ModelViewSet):
 
    serializer_class = FsiMAllocDetailsSerializer
    queryset = FsiMAllocDetails.objects.all()

class FsiMAllocLeafSelectionViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocLeafSelectionSerializer
    queryset = FsiMAllocLeafSelection.objects.all()

class FsiMAllocationRuleViewSet(viewsets.ModelViewSet):
     
    serializer_class = FsiMAllocationRuleSerializer
    queryset = FsiMAllocationRule.objects.all()

class TrackViewSet(viewsets.ModelViewSet):
    
    serializer_class = TrackSerializer
    queryset = Track.objects.all()

class AlbumSerializerViewSet(viewsets.ModelViewSet):
    
    serializer_class = AlbumSerializer
    queryset = Album.objects.all()

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import detail_route

from .models import Post, Comment, UserProfile 
from .serializers import PostSerializer, CommentSerializer, UserProfileSerializer


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer

    @detail_route(methods=['post'])
    def set_comment(self, request, pk=None):

        #get post object
        my_post = self.get_object()  
        serializer = CommentSerializer(data=request.data)                 
        if serializer.is_valid():
            serializer.save(post=my_post)
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)