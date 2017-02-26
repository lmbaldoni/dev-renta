from django.db import models
from pygments.lexers import get_all_lexers
from pygments.styles import get_all_styles

LEXERS = [item for item in get_all_lexers() if item[1]]
LANGUAGE_CHOICES = sorted([(item[1][0], item[0]) for item in LEXERS])
STYLE_CHOICES = sorted((item, item) for item in get_all_styles())


class batch(models.Model):
    V_BATCH_ID = models.IntegerField(default=0)
    V_BATCH_DESCRIPTION = models.CharField(max_length=100, blank=True, default='')
    V_CREATED_BY = models.CharField(max_length=20)
    V_CREATED_DATE = models.DateTimeField(auto_now_add=True)
    V_LAST_MODIFIED_DATE = models.DateTimeField(auto_now_add=True)
    V_LAST_MODIFIED_BY = models.CharField(max_length=20)
    V_BATCH_TYPE = models.CharField(max_length=5, blank=True, default='')
    V_SRC_FRAMEWORK = models.CharField(max_length=5, blank=True, default='')
    V_DSN_NAME = models.CharField(max_length=50, blank=True, default='')
    V_IS_SEQUENTIAL = models.CharField(max_length=5, blank=True, default='')
        
    class Meta:
        ordering = ('V_BATCH_ID',)


class parameter(models.Model):
    V_BATCH_ID = models.IntegerField(default=0)
    V_TASK_ID = models.CharField(max_length=20, blank=True, default='')
    I_PARAMETER_ORDER = models.IntegerField(default=0)
    V_PARAMETER_NAME = models.CharField(max_length=400, blank=True, default='')
    V_PARAMETER_VALUE = models.CharField(max_length=400, blank=True, default='')
            
    class Meta:
        ordering = ('V_BATCH_ID','V_TASK_ID','I_PARAMETER_ORDER',)

