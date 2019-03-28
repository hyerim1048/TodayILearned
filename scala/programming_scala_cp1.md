# Introduction To Scala

### Seq[] : 일정한 순서로 반복 가능한 추상적 컬렉션 
### 스칼라 함수에서 등호를 쓰는 이유
* 모호성을 피하기 위해서
* 함수를 다른 인자에 넘길 수도 있고 함수가 함수를 반환할수도 있는 functional programming 특징 
* function literal : unnamed function like lambda, closure, proc..
* scala에서 마지막 expression이 return value가 되며, 보통 return 을 쓰는 경우가 많지는 않다

* 클래스는 class, singleton object 는 object라고 써준다
* sigleton object 인스턴스는 오직 하나만 생성할 수 있다. new Object를 선언하지 못한다.

* scala는 return 타입을 추론할 수 있지만 메서드의 매개변수 타입은 추론 못한다. 이는 local type inference를 하기 때문으로 전체 코드를 보고 추론하는 것이 아니라 특정 영역에서 추론을 하는 것이다. 그래서 반환도 recursive한 함수일 경우에는 반환타입을 반드시 지정해주게 된다.

* object 와  package를 정의해서 JVM 어플리케이션을 만들 수 있다.
* 디렉터리 구조는 패키지 구조와 일치해야 한다. 하지만 최상위 디렉토리 부터 맞출 필요는 없다. /scala/aa/test/... package test.... 

### Scale Concurrency
* class 선언 앞에 case를 넣으면 각각의 생성자 매개변수가 자동으로 초기화되고 나서 그 값을 바꿀 수 없게 된다. read mode
* 그리고 case를 선언하게 되면 컴파일러가 자동으로 몇 개의 메서드를 만들어준다. 개인이 설정하지 않아도 되어서 편하다.

* == : logical comparation을 위해서 equals 를 호출하며, 자바에서 reference 만 비교하는 것과는 다르다
* 

