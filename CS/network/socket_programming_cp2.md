## 소켓

### 프로토콜이란?
* 컴퓨터 상호간의 대화에 필요한 통신규약

```c
#include <sys/socket.h>

int socket(int domain, int type, int protocol);
```

* domain : protocol Family
  * PF_INET : IPv4
  * PF_INET6 : IPv6
* type : 소켓의 데이터 전송방식.  protocol family 안에 여러 전송방식이 존재한다.
  * SOCK_STREAM (연결지향형 소켓)
    * 소켓은 내부적으로  buffer (바이트 배열)을 가지고 있고 전송되는 데이터는 버퍼에 저장된다.
    * 데이터는 전송되는 순서대로 수신된다.
    * 소켓과 소켓은 1대1로 연결되어야 한다.
  * SOCK_DGRAM (비연결 지향형)
    * 데이터의  Boundary 가 존재, 손실 우려, 한번에 전송할 수 있는 데이터 크기 제한

  TCP
  ```c
  int tcp_socket=socket(PF_INET, SOCK_STREAM, IPROTO_TCP);
  ```
  UDP
  ```c
  int udp_socket=socket(PF_INET, SOCK_DGRAM, IPROTO_UDP);
  ```

  IPv4 기반 주소(IP, port) 전달

  ```c
  struct sockaddr_in
  {
    sa_family_t sin_family; // 주소체계
    uint16_t sin_port; // 16 bit TCP/UDP Port
    struct in_addr sin_addr; // 32bit IP
    char sin_zero[8];
  }
  ```
