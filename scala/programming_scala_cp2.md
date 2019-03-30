## 입력은 조금만, 일은 더 많이


### Semicolons
* 예제를 구분하는 delimiter
* 한 줄에 여러 식을 넣을 때 사용

### 2.2 변수 정의
* val(value object) and var
* 변수는 heap에 할당된 객체를 참조한다
* 다음과 같이 array 를 val로 선언할 경우, 재할당할 수 없지만 배열의 원소는 변경 가능하다

```scala
val array: Array[String] = new Array(5)
``` 
* var & val 모두 선언할 때 초기화해야 한다.
* tyoe의 생성자 매개변수에 val, var를 쓸 경우 반드시 초기화가 필요한 것은 아니다. 그때에는 val는 변경 불가능, var는 변경 가능을 의미한다.
* 자바에서는 primitive type (char, byte,short,int, long, float) 과 같은 기본타입은 객체(참조)와 다르고 원래의 값만 존재하지만, scala에서는 이것조차 method를 가진 객체이다.
* 버그를 방지하기 위해서 가능한 한 변경 불가능한 값을 활용하도록 하자.

### 2.3 범위
* Range 객체 
### 2.4부분 함수(Partial Function)
* 모든 가능한 입력에 대해 결과를 정의하지 않는 함수



