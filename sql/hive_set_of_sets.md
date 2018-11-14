### hive에서 그룹별 set(array) 들의 set 만들기

* lateral viw explode 함수를 통해 array를 테이블로 펼친 후
* collect_set을 통해 다시 묶어준다.

```
select 
  id, 
  collect_set(tokens) 
FROM
  ts LATERAL VIEW explode(values) AS tokens
group by
  id;
```

https://stackoverflow.com/questions/43728191/collect-set-on-array-type-with-group-by-in-hive
