from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from batchs.models import batch
from batchs.serializers import BatchSerializer
    
class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)


@csrf_exempt
def batch_list(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        batchs = batch.objects.all()
        serializer = BatchSerializer(batchs, many=True)
        return JSONResponse(serializer.data)
    
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = BatchSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data, status=201)
        return JSONResponse(serializer.errors, status=400)


@csrf_exempt
def batch_detail(request, pk):
    """
    Retrieve, update or delete a code snippet.
    """
    try:
        batch = batch.objects.get(pk=pk)
    except batch.DoesNotExist:
        return HttpResponse(status=404)
    
    if request.method == 'GET':
        serializer = BatchSerializer(batch)
        return JSONResponse(serializer.data)
    
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = BatchSerializer(batch, data=data)
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data)
        return JSONResponse(serializer.errors, status=400)
    
    elif request.method == 'DELETE':
        batch.delete()
        return HttpResponse(status=204)