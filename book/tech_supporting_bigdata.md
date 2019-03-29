## 빅데이터를 지탱하는 기술

* streaming vs batch processing
: 실시간의 빠른 대용량 데이터 처리 vs 집계후 처리 
* 분산 스토리지
* hive와 같은 분산 데이터 처리
* workflow 관리

* Mesos -> Yarn 없이 Spark 리소스 관리
* spark : 중간 단계 생략, 중간 데이터 유실되면 다시 돌리지 뭐! mapreduce가 중간데이터 저장하는거랑 다름
* ES + 로그수집 Logstash + 시각화 Kibana = ELK 스택이라고 부름
