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
