## TCP/IP

효율적인 데이터 송수신을 위해서는 소프트웨어 뿐만이 아니라 물리적 환경이 잘 구축되어 있어야 한다.

이러한 이유로 문제를 영역별로 나눠서 인터넷을 통한 효율적인 데이터의 송수신을 하고자 하는 결론을 얻게 되었다. 


* Link  계층 :  Lan, wan 과 같은 물리적인 연결을 담당
* IP 계층 : 목적지로 데이터를 전송하기 위해서 거쳐야할 경로를 정함. IP 프로토콜. 오류발생에 대한 대비가 되어 있지 않음
* TCP/UDP 계층 : 경로를 바탕으로 데이터를 전송하는 계층으로  TCP는 신뢰성 있는 데이터 전송을 담보로 한다
* Application 계층 : 네트워크 프로그래밍의 대부분을 차지하며, 나머지는 소켓이 담보한다.

tcp 서버 함수 호출 순서

socket() -> bind() -> listen() -> accept() -> read/write() -> close()

bind 를 통해 소켓에 주소를 할당한 후  listen 을 통해 연결 요청 대기상태로 들어간다.

```c
#incluse <sys/socket.h>

int listen(int sock, int backlog);

```

backlog :  연결 요청 대기  Queue, 5면 5개까지 대기
