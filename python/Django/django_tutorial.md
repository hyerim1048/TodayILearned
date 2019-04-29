## Database

### [PostgreSQL](https://docs.djangoproject.com/en/2.2/ref/databases/#postgresql-notes)

- psycopg2(2.5.4) is required
- default configuration
    - client_encoding: 'UTF8'
    - default_transaction_isolation: 'read committed'
    - timezone: 'UTC'
- [Isolation level](https://www.postgresql.org/docs/current/transaction-iso.html)?
    - default isolation level in PostgreSQL
        - *Read Committed*
            - SELECT query sees only data committed before the query began
            - → 커밋되지 않은 or 실행 중 변한 데이터는 볼 수 없다

    ### [Django-admin](https://docs.djangoproject.com/en/2.2/ref/django-admin/)

    [각 default files 에 대한 설명](https://docs.djangoproject.com/en/2.2/intro/tutorial01/)

    ### Django Restframework

    - [settings.py](http://settings.py)

        INSTALLED_APPS = (
            ...
            'rest_framework',
        )

    - [urls.py](http://urls.py)
    - path can be whatever

        urlpatterns = [
            ...
            url(r'^api-auth/', include('rest_framework.urls'))
        ]

    - Restframework global setting은 아래에서 실행

        REST_FRAMEWORK = {
            # Use Django's standard `django.contrib.auth` permissions,
            # or allow read-only access for unauthenticated users.
            'DEFAULT_PERMISSION_CLASSES': [
                'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly'
            ]
        }

    - serializer
    - [https://yunhookim.tistory.com/7](https://yunhookim.tistory.com/7)
        - instances into representations such as json

    ### User Auth

    - using AbstractUser
    - [https://whatisthenext.tistory.com/128](https://whatisthenext.tistory.com/128)

        from django.db import models
        from django.contrib.auth.models import AbstractUser
        
        class User(AbstractUser):
            bio = models.TextField(max_length=500, blank=True)
            location = models.CharField(max_length=30, blank=True)
            birth_date = models.DateField(null=True, blank=True)

    - rest framework
        - [https://www.django-rest-framework.org/api-guide/authentication/](https://www.django-rest-framework.org/api-guide/authentication/)
    -
