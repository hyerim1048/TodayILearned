### Hive Strict Mode에서 제한되는 Query

```
set hive.mapred.mode=strict
```

* It restricts queries of partitioned tables without a WHERE clause
: Partition 을 명확히 지정해야 한다. 생각없이 partition을 항상 지정했기 때문에 nonstrict 모드에서도 안된다고 생각했다.
실제로 해보니까 strict 모드에서만 불가능하다.

* restrict ORDER BY operation without a LIMIT 
(since it uses a single reducer which can choke processing !!)
: order by는 결국 하나의 reducer가 마지막에 처리해야 하기 때문에 LIMIT 을 걸도록 권고하고 있다.


+추가) dynamic partition 도 strict mode로 설정한다면?

```
hive.exec.dynamic.partition.mode=strict
```
static partition 하나를 항상 명시해주어야 한다. 매우 귀찮지만 원치 않는 파티션 생성을 피하기 위해 default로 보통 막는다.
( 참고자료 : https://saurzcode.in/2015/01/hive-strict-mode/) 

strict 모드를 풀고 싶으면 다음과 같이 실행하는데
편하긴 하지만 맵리듀스가 원래 느린데 더 느려진다는 글도 있다. (https://118k.tistory.com/659)
```
hive> set hive.exec.dynamic.partition.mode=nonstrict -- 이게 없으면 dynamic partitioning할 수 없다.
hive> set hive.exec.dynamic.partition=true -- 데이터를 동적으로 넣겠다고 한다.
```
