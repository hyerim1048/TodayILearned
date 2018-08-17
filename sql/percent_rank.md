### hive 에서 value를 정렬해서 0~1 사이의 퍼센티지로 표현하고 싶을 때는

#percentile 함수말고 모든 값에 대한 rank를 0~1사이로 표현하고 싶을때 아래의 함수를 사용한다

```sql
select ticker, close, percent_rank() over(partition by ticker order by close) as closing 
from acadgild.stocks
```

https://acadgild.com/blog/windowing-functions-in-hive
