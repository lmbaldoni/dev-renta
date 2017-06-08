from django.conf.urls import  include, url
from django.contrib import admin
admin.autodiscover()

from members.viewsets import MemberViewSet,AttributeViewSet,DimensionViewSet
from common.viewsets import FolderViewSet,TableViewSet,ColumnViewSet
from profitability.viewsets import FsiMAllocDetailsViewSet,FsiMAllocLeafSelectionViewSet,FsiMAllocationRuleViewSet,PostViewSet,AlbumSerializerViewSet

from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register(r'members', MemberViewSet)
router.register(r'attributes', AttributeViewSet)
router.register(r'dimensions', DimensionViewSet)
router.register(r'folders', FolderViewSet)
router.register(r'tables', TableViewSet)
router.register(r'columns', ColumnViewSet)
router.register(r'ruleDetails', FsiMAllocDetailsViewSet)
router.register(r'ruleLeaf', FsiMAllocLeafSelectionViewSet)
router.register(r'ruleHeader', FsiMAllocationRuleViewSet)

router.register(r'albums', AlbumSerializerViewSet)
router.register(r'post', PostViewSet)


urlpatterns = [#'',
    # Examples:
    # url(r'^$', 'test_rest.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^admin/', include(admin.site.urls)),
]