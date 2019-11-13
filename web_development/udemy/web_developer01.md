### [www.google.com](http://www.google.com) 에 들어가면 일어나는 일

1) ISP : 각 나라의 Internet provider 에게 [google.com](http://google.com) 을 물어본다 

2) ISP는 DNS : a phone book 에게 dns의 IP 주소를 물어본다

3) google.com의 IP 주소를 DNS 서버가 반환한다.

4) browser는 IP 주소를 받고 다시 그 주소로 응답을 요청한다
- browser : request server with IP address
- server : html, css, javascript 를 준다
- browser:  rendering을 한다

### Internet backbone

[https://www.submarinecablemap.com/](https://www.submarinecablemap.com/)

- physical cable이 ISP 뒤로 실제로 인터넷 backbone과 연결되어 있다
- traceroute [google.com](http://google.com)
    - If you see ******* (asterisk)** in your output: If a packet is not acknowledged within the expected timeout (5seconds), an asterisk is displayed. Sometimes this can be due to your internet connection or **traceroute** may show **** because of widespread use of firewalls and other security practices by the company that owns that server

### three important things to load faster

- Location of Server
- How Many Trips?
- Size of Files
