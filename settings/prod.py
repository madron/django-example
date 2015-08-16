from .common import *

DEBUG = False
if os.getenv('DEBUG', None) == 'True':
    DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': '/sqlite/db.sqlite3',
    }
}

MEDIA_ROOT = '/media'
STATIC_ROOT = '/static'

MEDIA_URL = '/media/'
