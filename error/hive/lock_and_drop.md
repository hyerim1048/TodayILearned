### hive drop 헀으나 테이블이 삭제되지 않는 문제

* hive에서 개인 쿼터 용량을 초과한 테이블(internal table인데도 불구하고)을 drop할 경우 데이터를 다 삭제하지 못해 에러를 뱉는 것이 아니라 
meta data만 지운 후 "나 테이블 다지웠다~~" 한다.

* 이럴 경우에 dynamic partition과 같이 사용하면 최악을 맞이할 수도 있다.

```
INSERT into table abc partition ( year, month, day ) 
select <col_list>, year , month, day from xyz 
WHERE year=2015 and month = '06' distribute by day ;
```
dynamic partition에서 다음과 같은 구문을 사용하면, 문제가 생길 수 있다.

1) MR잡을 하면서 데이터를 target location에 로드한다. 
2) hive client는 바통받아서 그 location을 스캔하며 얼마나 많은 파티션이 있는지 metastore를 통해 list를 받아온다. 그리고 여기서 어떤 파티션이 load되어야 하는지 확인한다.
* 여기서 문제는 동적 파티셔닝이기 떄문에 year, month, day를 특정할 수 없고, 모든 year, month, day를 찾아보기 시작하는데, 
* 만약 데이터 파티션이 너무 많고, 데이터가 많으면 오래걸리게 된다.
자세한 내용을 여기 => https://qubole.zendesk.com/hc/en-us/articles/214885263-HIVE-Dynamic-Partitioning-tips

이러한 문제때문에 hive가 계속 테이블을 지우지 못하면 데이터는 계속해서 쌓이고, dynamic partitioning을 하면
점점 느려지게 된다.


이럴 경우 동적 파티셔닝을 하지 않던가, 데이터를 drop 구문으로 해결하기보다 -rm -r, 쿼터가 너무 큰 경우 어쩔 수 없이
-rm -r -skipTrash를 사용하는 것이 낫다.


### lock 걸리는 문제

젠킨스에서 job을 분명히 stop 시켰는데 내부적으로 처리가 안 될 경우가 있다.
그럴 경우 다시 실행하는 잡이 앞선 잡의 진행으로 인해 lock이 걸려 error를 뱉는다.

hadoop job -list 를 보면서 또는 리소스 매니저를 통해 찾아애서
잡을 다시 죽여!버린다.
```
hadoop job -kill 
```

버전이 높으면 mapred job -kill를 써도 된다.
