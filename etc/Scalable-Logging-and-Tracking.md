# Scalable Logging and Tracking 

by netflix, 06.28.2012 

요약 : 유저를 방해하지 않는 빠른 로그 수집 서버를 만들기 위해서 취한 방식들
* 실패 확인 후 데이터 처리 
* 비동기로 로직 처리 후 queue로 보냄 
* Auto-Scaling과 모니터링을 고려함 

# Introduction

- recommendation을 위해 필요한 데이터를 실시간으로 수집해야 함
    - 유저에게 방해되지 않고

# Considerations

- low latency
- scale to handle billions of requests a day
- noncritical data
- not hold the request for any longer than required
- grab HTTP request → push it to thread pool for processing later, flush the response immediately

### fail fast / first

- identify failure cases first before processing
- if cookie is needed for all data → crack cookie before dealing with other request parameters

### HTTP Codes

- grab all 2xx, 4xx, 5xx codes and if some services doesn't care the failure just returned 202

### Dependencies can slow down

- network glitches and service latency 가 일어날 수 있는 calls를 찾아서 java future 로 감싸버림

### Process Later

- put data into a queue for asynchronous execution by executor pool

### Auto-Scaling

- CPU load : alert at instance and cluster levels
- RPS (traffic) : metrics for auto-scaling a cluster
- powered by **Servo** (netflix opensource)

### Persistence

- Individual machines have agents send the logs to collectors and to the data sink (HDFS)

### Common Infrastructure / Multiple end-points

-