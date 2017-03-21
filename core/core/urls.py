from django.conf.urls import  include, url
from django.contrib import admin
admin.autodiscover()

from members.viewsets import MemberViewSet
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register(r'members', MemberViewSet)


urlpatterns = [#'',
    # Examples:
    # url(r'^$', 'test_rest.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^admin/', include(admin.site.urls)),
]