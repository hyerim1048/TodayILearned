https://www.safaribooksonline.com/library/view/high-performance-spark/9781491943199/ch04.html#joins


SQL & Core

스파크 core과 sql은 같은 기능을 제공하는 joins을 사용한다. joins은 매우 흔하고 강력하지만 Large metwork transfer와 우리가 다룰수 없는 데이터 셋까지 만들기 때문에 성능에 중요한 영향을 끼친다. core SPARK 에서 operation의 순서 또한 매우 중요하다.

core Spark joins

Join은 각각의 RDD로부터 일치하는 키값들을 같은 파티션에 놓고 local에서 결합해야 하기 때문에 매우 expensive하다. 만약 RDD가 partitioners들을 모른다면 양쪽의 RDD가 partitioner를 공유하고 같은 key를 가진 data가 같은 partition에 있어야 하기 때문에 그들은 shuffle되어야 한다. 같은 partitioner를 가지고 있다면 data는 같은 장소에 있을 것이다 4-3처럼, network transfer을 피하기 위해
partitioner가 같던지 같지 않든지, 만약 rdd중 하나가 (or both) 알려진 partitioner를 가지고 있다면,  only a narrow dependecy가 성립한다.(4-2).


default join operation은 양쪽의 RDD에 존재하는 키의 값들만을 include한다. 한 key에 대해서 multiple value가 있다면 모든 key/value pair의 중복이 있어야 한다. 가장 좋은 것은 아마도 양쪽의 RDD가 distinct key들에 대해서 동일한 set를 가지고 있을 떄이다/ duplicate keys가 있다면 데이터의 크기는 dramatic하게 커질 것이고 이건 바로 성능 저하 문제를 일으킬 것이다. 그리고 어떤 키가 양쪽 RDD에도 존재하지 않는다면 너는 데이터 한행을 잃게 될 것이다. 여기에 guideline이 있다.


Choosing an Execution plan

data를 join하기 위해서 스파크는 같은 partition에 존재하는 데이터(the data based on each key)가 필요하다. 조인 실행에 있어서 default값은 shuffled hash join이다. shuffled hash join은 각각의 partition에 있는 데이터가 같은 키를 포함하고 있다는 게 확실해야한다. 그 키는 처음에 같은 partitioner를 가진 second dataset을 파티셔닝한 키이다. 그래서 양쪽의 dataset으로부터 같은 hash value들을 가지고 있는 키들은 같은 partition에 있다. 이건 작동을 잘하지만 필요이상으로 expensive하다. 항상 shuffle을 요구하기 때문이다. shuffle은 피할 수 있다 만약에 양쪽의 RDD가 known partitioner을 가진다거나 데이터셋 하나가 memory에 알맞을 정도로 충분히 작을 경우에 broadcast hash join을 할 수 있다. (나중에 좀더 설명할 것이다)
