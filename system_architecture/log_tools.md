# Log 수집기 

Created: Oct 21, 2019 11:21 PM

**Log 수집기**

Message Q를 사용하거나

API 서버에서 파일을 로그로 저장한 후에 Fluentd, Logstash 등의 수집기를 이용하는 방법도 있다

**리디북스 로그 수집기**

[https://www.theteams.kr/teams/2763/post/68121](https://www.theteams.kr/teams/2763/post/68121)

**Apache Flume**

• 로그와 같은 데이터의 흐름 제어 (streaming)

• Agent : Source, Channel,Sing 로 이루어진 java process

• Source : 외부에서 입력받아 channel로 전달하고 channel은 event를 저장하고 있다 Sink로 전달

• Sink 와 다른 agent 의 source가 같은 타입이면 이벤트 전달 가능

![](blob:notion://www.notion.so/f1da05db-2af1-4ead-be28-6d9209440a07)

**모니터링 알람**

• JSON 리포팅 - flume에서 제공

• Pingdom

• → CDH 알람 트리거

• Cloudera 배포판 사용 중

**Filebeat**

[https://coding-start.tistory.com/135](https://coding-start.tistory.com/135)

Filebeat는 로그와 파일을 경량화된 방식으로 전달하는 Producer

지정ㅇ한 로그 파일에서 이벤트가 발생하면 harvester를 시작하고 harvester로 로그 데이터를 읽고 libbeat에 보낸다

**Fluentd**

구조가 간단

![](blob:notion://www.notion.so/62293992-30f7-4d31-947f-bc480f296f0e)

**듀랑고 로그 시스템**

110TB

• 높은 가용성 : 죽어서 안남으면 안돼! 항상 살아서 돌아가야 해

• 실시간 조회 : 생산성 향상을 위햇 , 검색, 조회, 로그 발생 후 5초 이내 조회하게 함

• 분석 및 시각화 : sql 가능 ,

• 관리부담 최소화 : 로그 유입량에 따라 시스템 확장 및 축소가 가능해야 함

**수집 pipeline**

Fluend → kinesis → lambda → s3

• Fluentd : C + Ruby, 다양한 플러그인

• 여러 노드들의 로그를 하나의 호스트 안에 있는 fluentd 가 에이전트 담당함

•

우아한 형제들

[http://woowabros.github.io/woowabros/2017/07/30/logdata.html](http://woowabros.github.io/woowabros/2017/07/30/logdata.html)