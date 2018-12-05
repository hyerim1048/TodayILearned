
### 특정 이름으로 시작하는 테이블들 다 지우기!
``` 
hive -e "use database;show tables 'temp_*'" | xargs -I '{}' hive -e 'drop table database.{}'
```

https://stackoverflow.com/questions/35888972/dropping-multiple-tables-with-same-prefix-in-hive
