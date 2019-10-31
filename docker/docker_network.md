# docker network

### docker networks cli

- docker network ls
    - bridge : NAT firewall
    - NAME - DRIVER - SCOPE
    - bridge 도커 내부 network.
        - the default bridge network driver allow containers to communicate with each other when running on the same docker host
        - Each container connected to a private virtual network "bridge"
        - Each virtual network routes through NAT firewall on host IP
    - host
        - —net=host 로 연결하면 skip virtual networks and use host IP
    - none
- docker network inspect
- docker network connect 로 기존에 있는 container에 연결할 수 있다
    - 아니면 container를 run 할 때 network 이름을 지정할 수도 있다

내가 새로운 virtual network를 만들 수 있다 

bridge 드라이버로 생성이 되는데 

network driver 는 built-in or 3rd party extensions that give you virtual network features 

    docker network create my_net 
    >> a driver of bridge로 로컬에 생성되며 고유한 subnet을 가지고 있다
    docker container run -d --name my_nginx2 --network my_net nginx
    >> 이 network를 바탕으로 한 container를 생성할 수 있다 

- 장점: port 옵션을 통해 host로 드러내지 않는이상 하나의 서버 내에서 port들을 보호할 수 있다

### docker networks DNS

- —link option to enable DNS on default bridge
    - 그런데 default bridge가 아니라 내가 만든 network 이름을 쓰면 자동으로 link가 되기 떄문에 관리하기 편해짐
- ip가 계속 변하기 때문에 이름으로 정해놓으면 좋음
- Forget IP!
    - Static IP or using IP for talking to containers is anti-pattern! Avoid it
    - docker 죽거나 살아나거나 바뀌기 때문에
    - DNS name을 써라
- Docker DNS
    - Docker daemon has a built in DNS server by default

### round-robin DNS

- a technique of load distribution for internet protocol service
    - by managing the DNS responses to address requests from client
