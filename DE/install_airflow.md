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


## DAG

- a configuration file specifying the DAG's structure as code
    - will run on different workers at different points in time
    - cannot be used to cross communicate between tasks
        - for this, use xCom !!

    """
    Code that goes along with the Airflow tutorial located at:
    https://github.com/apache/airflow/blob/master/airflow/example_dags/tutorial.py
    """
    from airflow import DAG
    # to instantiate a DAG 
    from airflow.operators.bash_operator import BashOperator
    from datetime import datetime, timedelta
    
    # Base Operator Arguments
    default_args = {
        'owner': 'airflow',
        'depends_on_past': False,
        'start_date': datetime(2015, 6, 1),
        'email': ['airflow@example.com'],
        'email_on_failure': False,
        'email_on_retry': False,
        'retries': 1,
        'retry_delay': timedelta(minutes=5),
        # 'queue': 'bash_queue',
        # 'pool': 'backfill',
        # 'priority_weight': 10,
        # 'end_date': datetime(2016, 1, 1),
    }
    
    dag = DAG('tutorial', default_args=default_args, schedule_interval=timedelta(days=1))
    
    # t1, t2 and t3 are examples of tasks created by instantiating operators
    t1 = BashOperator(
        task_id='print_date',
        bash_command='date',
        dag=dag)
    
    t2 = BashOperator(
        task_id='sleep',
        bash_command='sleep 5',
        retries=3,
        dag=dag)
    
    # templating 제공 
    # jinja templating
    templated_command = """
        {% for i in range(5) %}
            echo "{{ ds }}"
            echo "{{ macros.ds_add(ds, 7)}}"
            echo "{{ params.my_param }}"
        {% endfor %}
    """
    
    t3 = BashOperator(
        task_id='templated',
        bash_command=templated_command,
        params={'my_param': 'Parameter I passed in'},
        dag=dag)
    
    t2.set_upstream(t1)
    t3.set_upstream(t1)

- When searching for **DAGs**, Airflow only considers python files that contain the strings “airflow” and “DAG” by default. To consider all python files instead, disable the DAG_DISCOVERY_SAFE_MODE configuration flag.

### DAG's Scope

- DAG must appear in **globals()**
- here, Only **dag_1 will be loaded**
- with SubDagOperator if using function, Airflow will not try to load it as a standalone DAG

    dag_1 = DAG('this_dag_will_be_discovered')
    
    def my_function():
        dag_2 = DAG('but_this_dag_will_not')
    
    my_function()

### Context Manager

- dag를 operator안에 넣지 않아도 해당 context 내에서는 dag에 추가됨

    with DAG('my_dag', start_date=datetime(2016, 1, 1)) as dag:
        op = DummyOperator('op')
    
    op.dag is dag # True

### Operator

- atomic : don't need to share resources with other operators
