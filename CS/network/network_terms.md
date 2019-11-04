인터넷 관련 용어는 자꾸 까먹어서 정리해둔다. 

## DHCP (Dynamic Host Configuration on Protocol )

- TCP/IP 통신을 하려면 필요한 정보를 자동적으로 관리해야하는데 그르 위한 통신 규약임
- IP 주소 관리의 편의성을 높여줌
- 여러 할당 방식이 있음

## 외부 IP  / 공인 IP

- what's my IP 라고 구글에 검색하면 뜨는 나의 public IP address
- 보통 공유기가 대표 IP 를 가지고 있고 그걸 내부 IP를 활용해 각 기기에 나눠줌

## 내부 IP

- 같은 네트워크 망 안에서 기기 별로 할당된 내부 주소
- 외부에서는 이 주소로 접속 못한다

## 포트포워딩

- 내부 IP를 가진 기기에도 외부에서 접근할 수 있게 포트를 지정해서 내부에 연결된 기기 포트에 정확히 연결해준다
- 포트 + 전달

## MAC Address 랜카드 주소

각 기기별로 할당된 기기 고유 주소 

핸드폰, pc 등 모든 인터넷 사용하는 곳에는 있음

# overlay network

- 물리 네트워크 위에 성립되는 가상의 컴퓨터 네트워크
- 물리적 링크를 통하지만 고려하지 않는다

![](Untitled-ae28da3a-66cb-4753-938c-c8f5bfe3969d.png)

### 비구조화 overlay

- 각 노드가 인접 노드를 선택할 때 제약이 없도록 설계

### 구조화 overlay

- 각 노드 별 연결할 때 상대가 미리 결정되어 있고 topology도 설계되어 있는 network
- 메시지 도착이나 확장성, 효율성

[https://m.post.naver.com/viewer/postView.nhn?volumeNo=15242539&memberNo=19185109](https://m.post.naver.com/viewer/postView.nhn?volumeNo=15242539&memberNo=19185109)

# CIDR : Classless Inter-Domain Routing

[https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)

- a method for allocating IP addresses and IP routing
- router에 routing tables 이 많아지는 걸 늦추기 위해 만든 것이다
- IP addresses 는 two groups of bits로 이루어져 있다
    - network prefix : identify **a whole network** or subnet
    - least significant host identifier : specify a **particular interface of a host** on the network
- It is based on **the variable-length subnet masking (VLSM)** technique, which allows the specification of arbitrary-length prefixes

# network fabric

[https://searchnetworking.techtarget.com/definition/network-fabric](https://searchnetworking.techtarget.com/definition/network-fabric)

- industry term in a network topology
- to illustrate the idea that if someone were to document network components on paper, 그물망 처럼 짜여져 있어서 이렇게 부른다

# network topology

[https://searchnetworking.techtarget.com/definition/network-topology](https://searchnetworking.techtarget.com/definition/network-topology)

- the arrangement of nodes -- usually switches, routers, software switch/router features and connections in a network like a graph !
    - physical topology
        - the layout of nodes and physical connections including wires(ethernet), fiber optics 등등
        - e.g.  bus network, star network
    - Logical topologies
        - node의 logical relationship을 의미한다

# Ethernet

[https://searchnetworking.techtarget.com/definition/Ethernet](https://searchnetworking.techtarget.com/definition/Ethernet) 

- traditional tech for connecting wired local area networks LAN
    - communicate with each other via a protocol

### linux eth0

[https://unix.stackexchange.com/questions/82919/what-does-the-eth0-interface-name-mean-in-linux](https://unix.stackexchange.com/questions/82919/what-does-the-eth0-interface-name-mean-in-linux)  

- os 나 user가 first ethernet interface 에 부여한 이름이다.
    - wifi 를 쓰면 wlan 이라고 잡힐 것이다

[https://searchnetworking.techtarget.com/](https://searchnetworking.techtarget.com/)