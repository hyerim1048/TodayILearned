* spark.sql 에 바로 dynamic select form 을 붙일 수 있다.
* 아래와 같이 ${select_form_title = default_value,val1|val2|val3....} 으로 해주면 된다.
'''
select *
from data_table
where item = "${Select Item=,1(A)|2(B)|3(C)}"
'''
https://stackoverflow.com/questions/38780220/zeppelin-dynamic-form-drop-down-value-in-sql
