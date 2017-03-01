from django.db import models
from pygments.lexers import get_all_lexers
from pygments.styles import get_all_styles
from pygments.lexers import get_lexer_by_name
from pygments.formatters.html import HtmlFormatter
from pygments import highlight

LEXERS = [item for item in get_all_lexers() if item[1]]
LANGUAGE_CHOICES = sorted([(item[1][0], item[0]) for item in LEXERS])
STYLE_CHOICES = sorted((item, item) for item in get_all_styles())



class batch(models.Model):
    V_BATCH_ID = models.IntegerField(default=0)
    V_BATCH_DESCRIPTION = models.CharField(max_length=100, blank=True, default='')
    V_CREATED_BY = models.CharField(max_length=20,default='admin')
    V_CREATED_DATE = models.DateTimeField(auto_now_add=True)
    V_LAST_MODIFIED_DATE = models.DateTimeField(auto_now_add=True)
    V_LAST_MODIFIED_BY = models.CharField(max_length=20,default='admin')
    V_BATCH_TYPE = models.CharField(max_length=5, blank=True, default='')
    V_SRC_FRAMEWORK = models.CharField(max_length=5, blank=True, default='')
    V_DSN_NAME = models.CharField(max_length=50, blank=True, default='')
    V_IS_SEQUENTIAL = models.CharField(max_length=5, blank=True, default='')
    owner = models.ForeignKey('auth.User', related_name = 'batch', on_delete=models.CASCADE)
    highlighted = models.TextField()


    def save(self, *args, **kwargs):
        """
        Use the `pygments` library to create a highlighted HTML
        representation of the code snippet.
        """
        #lexer = get_lexer_by_name(self.language)
        #linenos = self.linenos and 'table' or False
        options = self.V_BATCH_DESCRIPTION and {'V_BATCH_DESCRIPTION': self.V_BATCH_DESCRIPTION} or {}
        formatter = HtmlFormatter(full=True, **options)
        self.highlighted = highlight(self.V_BATCH_ID, formatter)
        super(batch, self).save(*args, **kwargs)

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

