정리 링크 : https://app.additor.io/p/P1n6wmVF



라이브러리 사용이 가능하다
클로저스크립트 - 코딩한 파일을 자바스크립트 파일로 저장 가능
클로저 - 백엔드, 클로저스크립트 - 프론트엔드 사용할 경우에 백엔드와 프론트가 같은 모델을 share할 수 있어서 좋다.


언어의 특징

모든 구문을 list () 안에서 표현, list 의 element들은 공백으로 표현함.

(defn foo
  "I don't do a whole lot." -> 함수 설명. Optional 
  [x]
  (println x "Hello, World!”)) 


lein으로 실행하기

project.clj : 의존성 관리하는 파일
ns : namespace로 file하나 당 보통 하나의 ns 사용
자바 패키기와 같은 특징을 가지고 있기 때문에 디렉토리 제약이 있음 app / src
core.clj로 존재해야 문제가 없음
project 파일에 :main app.core 넣어주면, lein run -m app.core 에서 -m 옵션 주지 않아도 실행 가능


main 만들기

main 에 -를 앞에 붙이면 (-main) 자바에서도 인식


org.clojure/clojure — jar 파일로 java로 만들어진 언어임



 project.clj 에 다음 옵션 추가

:profiles {:uberjar {:aot :all}} lein을 실행시킬 때 실행 환경을 바꿔주는게 profile이고 uberjar는 미리 제공되고 있는 환경임 

옵션 aot: all를 줌 . 이 옵션은 클로저의 프로그램들은 패키징 할 떄

default:  class로 바로 만들지 않고 clj 그대로 패키징함
저 옵션을 주면 클래스로 바꿔서 패키징 되서 배포됨.
jar 파일을 보면 standalone  snapshot 있음 :  디펜던시까지 다 설정되어있는 jar파일


함수

기본적으로는 함수 선언은 사용하기 전에 함.
 declare 를 통해  hint 


 char

single char는 \char 로 씀


 Java  메소드 사용하기

(.length "aa”) java 메소드를 첫번째 인자에 넣어 사용 = closure 의 (count “aa”)
(.substring "abcd" 3) : java 메소드는 다 dot로 사용
(def rnd (java.util.Random.))




redis

maven repository 설명 확인 ->  project.clj 에 추가
(:gen class)
(:import [redist.clients.jedis Jedis])
