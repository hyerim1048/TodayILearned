## 상속과 구성 inheritance and composition

### Inheritance : 어떤 클래스가 다른 클래스의 참조를 갖는 것 

## 10.1 2차원 레이아웃 라이브러리 
* 2차원으로 레이아웃으로 배치하고 표현하는 라이브러리 만들자!

## 10.2 추상 클래스 

```scala
abstract class Element {
    def contents: Array[String]
}
``` 
* contents : 구현이 없는 메소드 선언; an abstract member of Element class
* 추상 멤버가 있는 클래스는 추상 클래스로 선언해야만 함! (abstract class Element ...)
* abstract class 를 생성할 수는 없다 

## 10.3 피라미터 없는 메소드 정의 

```scala
abstract class Element {
    def contents: Array[String]
    def height: Int = contents.length 
    def width: Int = if (height == 0) 0 else contents(0).length
}
```

* 파라미터 없는 메소드 : method 가 인자를 받지 않고 해당 객체의 필드를 읽기만 할 때 사용 
```scala
   val height = contents.length 
```
* val 을 통해 변경 불가능한 필드로 선언해도 클라이언트 입장에서는 동일함
* 필드는 클래스 초기화 때에 값을 미리 계산해서 약간 빠르지만 Element객체마다 값을 저장할 별도의 메모리 공간이 필요함 


* 빈 괄호 메소드 height(): Int
* 원칙적으로 빈괄호를 모두 생략할 수 있으나 객체의 property에 접근하는 것 이상의 기능을 수행하는 메소드라면 빈괄호를 사용하기를 권장함 

```scala
"hello".length // 부수효과 없으니까 사용 No
println() //() 사용하는게 나음
``` 

## 10.4 클래스 확장 
* 추상 클래스를 상속한 서브클래스를 만들자!
```scala
class ArrayElement(conts: Array[String]) extends Element {
    def contents: Array[String] = conts
}
```
* ArrayElement class가 Element 를 extends 했으며 이는 2가지 효과를 가짐. 
  1) private가 아닌 멤버를 모두 Element에게서 물려받는다
  2) ArrayElement는 Element의 Subtype이 된다.

* 단, subclass에 superclass와 동일한 멤버 정의가 있으면 superclass의 멤버를 상속받지 않는다 (override)
* 추상 멤버를 구현했다면 implement  
* extends가 없다면 scala.AnyRef를 상속한다고 가정한다. https://docs.scala-lang.org/ko/tutorials/tour/unified-types.html.html
* 서브타입 관계면 superclass를 필요로 하는 곳 어디에서나 subclass 값을 쓸 수 있다
```scala
val e: Element = new ArrayElement(Array("hello"))
```

## 10.5 method and field override 
* scala에서는 field 가 파라미터없는 method를 override할 수 있다
```scala
class ArrayElement(conts: Array[String]) extends Element {
  val contents: Array[String] = conts
}
```
* Element에서 **def** 로 선언된 abstract method가 ArrayElement에서 val로 구현되었다 (Java에서는 method와 field namespace를 구분하지만 scala는 오버라이드가 가능하기 때문에 field와 method는 동일한 namespace를 가진다. 즉 같은 이름으로 method와 field를 만들 수 앖다)
* scala는 그래서 2가지 namespace를 가진다
  1) 값(필드, 메소드, 패키지, 싱글톤 객체)
  2) type (클래스와 트레이트 이름)


## 10.6 파라미터 필드 정의

```scala
    class ArrayElement(
    val contents: Array[String]
) extends Element
``` 
* conts는 결국 contents로 들어가니까 비슷한 이름쓰지 않고 바로 인자를 받아 val로 넣어보았다
* var 도 사용가능하며
* 그 앞에 private, protected, override같은 수식자도 추가 가능하다


## 10.7 슈퍼클래스의 생성자 호출 
```scala
class LineElement(s: String) extends ArrayElemnt(Array(s)) {
    override def width = s.length
    override def height = 1 
}
``` 
* 배열이 아닌 1줄 짜리 문자열로 이루어진 레이아웃 원소를 표현하고 싶다면? 서브클래스를 위와 같이 추가하면 된다.
* 이 때 슈퍼클래스 생성자에 인자를 하나 전달해야 한다. (Array(s))

## 10.8 override 수식자 사용 
* scala에서는 override를 엄격히 구분해서 사용한다( 추상 멤버를 구현할 경우에는 override를 생략할수 있다 )  
* 기반 클래스에 있는 멤버를 오버라이드 하거나 구현하는 경우가 아니면 override 수식자를 절대 사용하면 안된다.
* 이를 통해 컴파일러가 발견하기 어려운 오류를 방지한다 
* (e.g. error: method hight overrides nothing. / override def hight = 1 ) hight는 기반 클래스에 없는 메소드기 때문에 오류 메세지로 응답한다

* fragile base class 는 기반 클래스에 추가한 멤버로 인해 클라이언트 코드가 깨지는 것을 의미하는데 
* 우연한 오버라이드 보통 그 원인이 된다. 이런 문제를 scala에서는 컴파일 시점에서 오류를 발생시켜 해결한다 

## 10.9 다형성과 동적바인딩 
* 다양한 형태로 서브클래스를 만들 수 있으며
* 

## 10.10 final 멤버 선언
* override를 막고 싶다면 final 수식자를 멤버에 붙인다. 

## 10.11 상속과 구성 사용

## 10.12 above, beside, toString 구현 
## 10.13 팩토리 객체 정의 
## 10.14 높이와 너비 조절 
## 10.15 한데 모아 시험해보기 






