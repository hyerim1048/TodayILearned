## 상속과 구성 inheritance and composition

### Ingeritance : 어떤 클래스가 다른 클래스의 참조를 갖는 것 

## 10.1 2차원 레이아웃 라이브러리 
* 2차원으로 레이아웃으로 배치하고 표현하는 라이브러리 

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
* ArrayElement class가 Element 를 extend 함 
  * 


