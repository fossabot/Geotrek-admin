from .dev import *
import os

DEBUG_TOOLBAR = True

INTERNAL_IPS += ('10.0.2.1',)

SESSION_COOKIE_AGE = 129600

if DEBUG_TOOLBAR:
    INSTALLED_APPS += (
        'debug_toolbar',
    )
    MIDDLEWARE_CLASSES = (
        'debug_toolbar.middleware.DebugToolbarMiddleware',
    ) + MIDDLEWARE_CLASSES

USE_X_FORWARDED_HOST = True

DATABASES['default']['NAME'] = os.environ.get('POSTGRES_DB', DATABASES['default']['NAME'])
DATABASES['default']['USER'] = os.environ.get('POSTGRES_USER', DATABASES['default']['USER'])
DATABASES['default']['PASSWORD'] = os.environ.get('POSTGRES_PASSWORD', DATABASES['default']['PASSWORD'])
DATABASES['default']['HOST'] = os.environ.get('POSTGRES_HOST', DATABASES['default']['HOST'])

BROKER_URL = 'redis://{}:6379/0'.format(os.environ.get('REDIS_HOST', "localhost"))

MAPENTITY_CONFIG['CONVERSION_SERVER'] = 'http://convertit:6543'

MAPENTITY_CONFIG['CAPTURE_SERVER'] = 'http://screamshotter:8001'