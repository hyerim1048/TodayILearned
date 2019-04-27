# Django Tutorial

Created: Apr 27, 2019 10:31 PM

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