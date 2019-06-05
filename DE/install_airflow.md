## airflow 

```
sudo -E setproxy pip3 install apache-airflow 
    
    airflow initdb
    
    setproxy sudo -E airflow webserver -p 9000
```

### kerberos

- renew_function
    - [https://github.com/apache/airflow/blob/master/airflow/security/kerberos.py](https://github.com/apache/airflow/blob/master/airflow/security/kerberos.py)

### Connections

- view 단에서 connection 정보 저장하면
- db로 그 정보를 저장함
- [https://github.com/apache/airflow/blob/master/airflow/www/views.py](https://github.com/apache/airflow/blob/master/airflow/www/views.py)
    - ConnectionModelView
