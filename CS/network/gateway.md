### Gateway 

Quora site 를 클릭하던 중  502 Bad Gateway 가 떠서 Gateway의 의미를 이해하기 위해 찾아보았다.

Gateway 를 위키피디아에서 찾아보면

A Gateway refers to :
* A gate or portal
* A portal, in science fiction and fantasy, a magical or technological doorway that connects two locations, worlds, or points in time

두 지점을 연결하는 관문이라는 뜻을 가지고 있다.

 컴퓨터 네트워크에서는 현재 사용자가 위치한 네트워크(정확히는 세그먼트-segment)에서 
 다른 네트워크(인터넷 등)로 이동하기 위해 반드시 거쳐야 하는 거점을 의미한다.
 
 이렇게 보면 왠지 라우터의 개념과 헷갈릴 수 있는데,  
 * router 는 Network layer 계층에서 두 통신망을 연결하는 역할을 한다면,
 * gateway 는 좀 더 상위 계층에서 서로 다른 프로토콜을 변환을 하는 관문을 의미한다.
 
 
* 그럼 502 Bad Gateway 문제는 왜 발생할까?
 두 프로토콜 상 교환의 역할을 해주는 것이다보니, gateway server 나  upstream server (https://en.wikipedia.org/wiki/Upstream_server) 가 데이터를 교환하기 위한 적절한  protocol 을 결정하지 못할 때  website page에 표시된다.
 또는 갑작스러운  overhead에 의해 발생하기도 한다.
 해결은 보통 다시 데이터를 요청하는 것으로 마무리된다.

 
 https://en.wikipedia.org/wiki/Gateway
 http://it.donga.com/6744/
 http://www.ktword.co.kr/abbr_view.php?id=447&m_temp1=399&nav=2
 https://www.itpro.co.uk/web-hosting/30258/what-is-a-502-bad-gateway-and-how-do-you-fix-it
