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
  
  * sin_family : AF_INET (Ipv4 4 bytes), AF_INET6(IPv6 16 bytes)
  * sin_port : 16bit port number, 네트워크 바이트 순서로 저장
  * sin_addr 
  
  3-3. 네트워크 바이트 순서
  
   CPU 마다 4바이트 정수 1을 저장하는 방식이 다를 수 있기 때문에, 그대로 데이터를 송수신하면 문제가 생긴다.
   * Big Endian (끝에 마지막 데이터가 들어감), Little Endian (끝에 첫 바이트가 들어감)
   이를  Host Byte Order 라고 한다. 참고로  intel 계열은 Little Endian 이다. 
   이를 해결하기 위해서  Network Byte Order 가 등장했다. Network Byte Order 는 무조건 Big Endian 이다.
   
   * Endian Conversions
   byte 순서를  network byte order 로 바꿔주는 함수는 아래와 같다.  short 형, long 형인가에 따라 함수가 바뀐다.
   ```c
   unsigned short htons(unsigned short);
   ```
   10진수 문자열을  network byte order 로 변환해주는 함수도 있다.
   ```c
   in_addr_t inet_addr(const char * string)
   ```
   매번  IP 주소를 입력하기 번거로운 경우  INADDR_ANY 상수를 사용하여 넣어줄 수 있다.
   라우터와 같이  multi -homed IP 주소가 두 개인 경우에 어떤 주소를 통해서 들어오더라도 수신할 수 있기 때문에 유용하다.
   
   NIC 랜카드가 두 개 이상인 경우 IP 주소할당을 요구하기 때문에 이렇게 주소를  input 으로 받는 함수가 있다.
   
   
   
