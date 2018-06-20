coursera_ml_7

 정리 링크 : https://app.additor.io/p/qXquA7xL

Optimization Objective 
logistic function 처럼 분류를 하고 싶다.


  Review on Logistic Function
logistic 의  Cost Function 을 보면,
 y=1 일때   cost 가 0이 되는 지점은 다음과 같다.
 SVM 의 그래프는 두 그래프의 결합으로 이루어져 있다 ( Pink Line)
 
 
  SVM의  Cost Function
logistic  의  cost function 에서  log  부분을  svm 의 이진 분류 각각의  cost function 으로 바꾸고,
 lambda/m 대신에  C 라는  constant 를 다음과 같이 곱해준다.  (C = 1/lambda)
 
 
 SVM 은  Margin 이 최대가 되는 지점의 선을 찾는다.

C 가 클 수록 하나의 데이터에 민감해  robust 하지 않은 선을 찾고
그렇게 크지 않으면  outlier 에 좀 더 강한 선을 찾는다.



Mathematics Behind Large Margin Classification


 Vector Inner Product
p = length of projection of v onto u 
||u|| = length of vector u
p*||u|| = u 와 v 의 inner product


SVM Decision Boundary
 inner product (theta ,  x)  = p * ||theta|| 
x 를  theta  로  projection  했을 떄의 길이  p 와  theta 의  norm 과의 곱


(the left graph below) small margin 의 그래프를 보면,
theta (0) = 0 이라 가정 : decision boundary starts from the origin
  inner product (theta ,  x)  = c(?)  인  선 ( green line)
margin 이 겹치지 않게 -1, 1   공간을 둠.
왜  norm of theta  가 작으면 좋은거지? optimization objective 가  norm 을 min하는 것임!
결국 maximize norm of these p1  : distance from training data


Kernel1
임의의 점  lemma 를 잡고
 l 과 x 의 관계를 정의하는  f 를 만든다. 여기서는 가우시안 커널을 사용한다.
 
가우시안 커널에서
 x 와 l 이 가까우면  f 는 1에 수렴하고
  멀면,  f 는 0에 수렴한다.
그림으로 보면 다음과 같다.
  분산의 크기에 따라서 크면 넓게 퍼진 종모양, 작으면 뾰족한 종모양을 가지게 된다.
  
   lemma 근처에 있는  x 들은  1 로 분류되고
그렇지 않은  x 들은 0으로 분류된다.

lemma  는 어떻게 정할까?
 At First,   x 들을  lemma 로 둔다.
 
 
 ### recent work on SVM
  최근에는  svm 을 많이 연구하는 분들이 없는 듯 하다.
  흥미로운 논문 2015 - Deep Convolutional Networks are Hierarchical Kernel Machines
