## 상속과 구성 inheritance and composition
 
* Inheritance : 어떤 클래스가 다른 클래스의 참조를 갖는 것 

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
* abstract class 의 인스턴스를 생성할 수는 없다. 구현이 없기 때문에 

## 10.3 피라미터 없는 메소드 정의 

```scala
abstract class Element {
    def contents: Array[String]
    def height: Int = contents.length 
    def width: Int = if (height == 0) 0 else contents(0).length
}
```
* 위의 3개의 메소드 모두 파라미터가 없다 ()도 없다
* 파라미터 없는 메소드 : method 가 인자를 받지 않고 해당 객체의 필드를 읽기만 할 때 사용 
```scala
   val height = contents.length 
```
* val 을 통해 변경 불가능한 필드로 선언해도 클라이언트 입장에서는 동일함
 * 필드는 클래스 초기화 때에 값을 미리 계산해서 약간 빠르지만 객체마다 값을 저장할 별도의 메모리 공간이 필요함 


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
* 추상 멤버를 구현했다면 (implement)  
* extends가 없다면 scala.AnyRef를 상속한다고 가정한다. https://docs.scala-lang.org/ko/tutorials/tour/unified-types.html.html
* 서브타입 관계면 superclass를 필요로 하는 곳 어디에서나 subclass 값을 쓸 수 있다 (아래 참고)
```scala
val e: Element = new ArrayElement(Array("hello"))
```

## 10.5 method and field override 
* scala에서는 **field** 가 파라미터없는 **method를 override**할 수 있다
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

* 다양한 형태로 서브클래스를 만들 수 있으며 이를 **subtyping polymorphism**이라고 함.
```scala
class UniformElement (
    ch: Char,
    override val width: Int,
    override val height: Int,
) extends Element {
    private val lint = ch.toString * width
    def contents = Array.fill(height)(line)
}
```
![hierachy](https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwjouK3q3cbhAhVE-2EKHcohBAUQjRx6BAgBEAU&url=https%3A%2F%2Fwww.artima.com%2Fpins1ed%2Fcomposition-and-inheritance.html&psig=AOvVaw1RcdZI83YgEYqYW40GkyCN&ust=1555027174375230)
```
val el: Element = new ArrayElement(Array("hello","world"))
val ae: ArrayElement = new LineElement("hello")
val e2: Element = ae 
val e3: Element = new UniformElement('x',2,3)
```  
* 코드를 보면 (4가지 val 정의가) 오른쪽에 있는 표현식의 타입이 왼쪽 type보다 상속계층에서 아래에 위치함 

* 변수나 표현식에 대한 메소드 호출은 **동적으로 바인딩**
* 즉, 실제 불리는 메소드를 표현식이나 변수(컴파일 시점)이 아니라 실행 시점에 객체의 타입을 따른다.
```scala
//abstract class
abstract class Element {
   def demo() = { println("element invoked")}
}
// override
class ArrayElement extends Element {
    override def demo() = { println("array element invoked!")}}

// no override // Element의 데모를 상속한다
class UniformElement extends Element 

def invokeDemo(e: Element) = {
    e.demo()
}

// ArryElement's implementation invoked 
invokeDemo(new ArrayElement)

// Element's implementation invoked
invokeDemo(new UniformElement)
```


## 10.10 final 멤버 선언
* override를 막고 싶다면 final 수식자를 멤버에 붙인다. 

## 10.11 상속과 구성 사용
* LineElement is an arrayElement?
* is-a 관계가 의심스러우면 쓰지말자. composition 으로 접근
```scala 
class LineElemnet (s:String) extends Element {
    val contents = Array(s) // reference to an array of string
    override def width = s.length 
    override def height = 1
}
```
* LineElement는ArrayElement 내용을 상속받지 않고 자신의 필드에 문자열 배열에 대한 참조를 가지도록 했다. 
* 즉,  Array와 구성(composition) 관계를 갖는다

## 10.12 above, beside, toString 구현 
```scala
def above(that: Element): Element = 
    new ArrayElement(this.contents ++ that.contents) // ++ : 두 배열을 이어붙인다

// 명령형 스타일 1st beside 
// 두 요소의 길이는 같다고 가정한다
def beside(that: Element): Element = {
    val contents = new Array[String](this.contents.length)
    for (i <- 0 until this.contents.length)
        contents(i) = this.contents(i) + that.contents(i)
    new ArrayElement(contents)
}

// 축약형 2nd
new ArrayElement(
    for (
        (line1, line2) <- this.contents zip that.contents
    ) yield line1 + line2
) 
// zip : 순서쌍 Tuple2 를 반환하는데 한쪽 길이가 더 길면 자른다.

//원하는 형식으로 화면에 표현하고 싶다
override def toString = contents mkString "\n"
// 배열 등 모든 시퀀스에서 사용가능한 mkString을 이용해 정의. 배열 원소 사이 사이마다 "\n"
```

## 10.13 팩토리 객체 정의 
* 팩토리 뒤로 감춰보자
* 팩토리 객체 : 다른 객체를 생성하는 메소드를 제공하는 객체
* 객체 생성 기능을 한곳에 모아서 제공하고 구체적인 내부 표현을 감출 수 있으며, 클라이언트 또한 라이브러리를 쉽게 이해할 수 있게 된다.
* 팩토리 객체를 만드는 가장 직관적인 방법은 Element 의 동반 객체를 만들고 이 객체를 레이아웃 요소의 팩토리 객체로 만드는 것이다
* 이를 통해 Element 와 싱글톤 객체만 노출, 하위 세부 구현은 감춤 

```scala
//싱글톤 팩토리 객체를 만든 후 private 클래스로 만들어서 내부 구현을 숨긴다.
object Element {
  private class ArrayElement(
    val contents: Array[String]
  ) extends Element
  private class LineElement(s: String) extends Element {
    val contents = Array(s)
    override def width = s.length
    override def height = 1
  }  

    // 팩토리 메소드
    def elem(contents: Array[String]): Element =
        new ArrayElement(contents)
    def elem(chr: char, width: Int, height: Int): Element =
        new UniformElement(chr, width, height)
    def elem(line: String): Element =
       new LineElement(line)
}
```
```scala
import Element.elem
abstract class Element {
  def contents: Array[String]
  ...
  def above(that: Element): Element = 
    elem(this.contents ++ that.contents)
}
...
```


## 10.14 높이와 너비 조절 (최종 코드)

```
import Element.elem

abstract class Element {
   def contents: Array[String]
   def width: Int = contents[0].length
   def height: Int = contents.length
   
   def above(that: Element): Element = {
     val this1 = this widen that.width //너비를 인자로 받아서 해당 너비의 요소를 반환
     val that1 = that widen this.width
     elem(this1.contents ++ that1.contents)
   }
   def beside(that: Element): Element = {
     val this1 = this heighten that.height
     val that1 = that heighten this.height
    elem
    for ((line1, line2) <- this1.contents zip that1.contents)
    yield line1 + line2)
   }
   def widen(w: Int): Element = 
      if (w <= width) this // that.width보다 크면 그냥 return하면 된다
      else {
        val left = elem(' ', (w - width) / 2, height) //UniformElement
        var right = elem(' ', w - width - left.width, height) // 남은 공백 넣어주기
       left beside this beside right // 전달받은 너비에 맞춰 contents를 가운데 베치하고 좌우에 필요한 만큼 공백을 채워넣는다
      }
   def heighten(h: Int): Element = 
     if (h <= height) this 
     else {
       val top = elem(' ', width , (w - height) / 2) //UniformElement
       val bot = elem(' ', width, h - height - top.height) 
       top above this above bot
     }
override def toString = contents mkString "\n"

}


```







