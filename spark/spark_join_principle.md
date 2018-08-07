https://www.safaribooksonline.com/library/view/high-performance-spark/9781491943199/ch04.html#joins


SQL & Core

스파크 core과 sql은 같은 기능을 제공하는 joins을 사용한다. joins은 매우 흔하고 강력하지만 Large metwork transfer와 우리가 다룰수 없는 데이터 셋까지 만들기 때문에 성능에 중요한 영향을 끼친다. core SPARK 에서 operation의 순서 또한 매우 중요하다.

core Spark joins

Join은 각각의 RDD로부터 일치하는 키값들을 같은 파티션에 놓고 local에서 결합해야 하기 때문에 매우 expensive하다. 만약 RDD가 partitioners들을 모른다면 양쪽의 RDD가 partitioner를 공유하고 같은 key를 가진 data가 같은 partition에 있어야 하기 때문에 그들은 shuffle되어야 한다. 같은 partitioner를 가지고 있다면 data는 같은 장소에 있을 것이다 4-3처럼, network transfer을 피하기 위해
partitioner가 같던지 같지 않든지, 만약 rdd중 하나가 (or both) 알려진 partitioner를 가지고 있다면,  only a narrow dependecy가 성립한다.(4-2).
