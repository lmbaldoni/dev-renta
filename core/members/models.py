from django.db import models
from pygments.lexers import get_all_lexers
from pygments.styles import get_all_styles

LEXERS = [item for item in get_all_lexers() if item[1]]
LANGUAGE_CHOICES = sorted([(item[1][0], item[0]) for item in LEXERS])
STYLE_CHOICES = sorted((item, item) for item in get_all_styles())


class member(models.Model):
    id_code = models.IntegerField(default=0)
    id_alfa = models.CharField(max_length=20, blank=True, default='')
    name = models.CharField(max_length=20, blank=True, default='')
    description = models.CharField(max_length=100, blank=True, default='')
    enabled = models.BooleanField(default=False)
    if_lead = models.BooleanField(default=False)
    create_date = models.DateTimeField(auto_now_add=True)
    create_by = models.CharField(max_length=20)
    modified_date = models.DateTimeField(auto_now_add=True)
    modified_by = models.CharField(max_length=20)

    class Meta:
        ordering = ('id_code',)