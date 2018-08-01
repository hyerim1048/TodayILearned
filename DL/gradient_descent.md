minimize an Objective function (error function)

types of optimization algorithms
1. First order optimization algorithms
Gradient descent  가 대표적
 parameter 에 대한  gradient 를 사용해서 최소화.
First order Derivative basically give us a line which is Tangential to a point on its Error Surface
a gradient is calculated using Partial Derivatives
2. second order optimization algorithms
use the second order derivative 
 tells us whether the first derivative is increasing or decreasing which hints at the function’s curvature
 a quadratic surface which touches the curvature of the Error Surface.
 계산 비용은 높지만, curvature of Surface.



## Gradient Descent

used to update weights in a direction of minimizing the loss function
BP using chain rule
non linearity to learn almost any arbitrary functional mapping
traditional way : calculate all the gradients in a data set - 1 update


SGD :  각  training example  별로  parameter update 를 진행함
업데이트가 빈번해서  variance 가 매우 높고  loss function 이 여기저기 튐
 더 좋은  local minimum 을 발견하기 쉽지만,    정확한  minimum 을 찾기엔 너무 복잡하게 움직임.
그래서  learning rate 를 천천히 줄여나가서 변동폭을 줄임.


#2. Mini Batch GD 



어려운 점

적절한  learning rate 를 찾기 어려움.  너무 작으면 학습이 안되고 너무 크면 발산 가능성
같은  learning rate 가  all parameter updates 에 사용됨. 만약 데이터가  sparse 하다면?
과연 모두를 같은 정도로 업데이트 해도 될까? 잘 일어나지 않는  feature 에 대해 너무 많은 업데이트를 하고 있지는 않은가?
 sub-optimal local minima 에 빠지기 쉽다.  Saddle points!! 


Gradient Descent  를 Optimize 하자


 Momentum

the way to accelerate SGD
 무관한 방향으로의 변동을 줄여줌
 by add fraction Y  of update vector of the past step to the current update vector
  t-1 번째 벡터의  fraction 을   현재  vector 에 더해줌
 fraction 은 보통  0.9 
 고전 물리학의  momentum 과 같음. 공이 굴러갈 때  momentum 이 모여서 속도가 점점 빨라지는 것과 같은 원리
 Oscillation 이 줄고,  convergence 가 안정적으로 !
 ex.  만약  gradient 가 같은 방향이었다면 속도가 빨라지고 반대라면 속도가 줄어듦
 
 
 Nesterov Accelerated Gradient



slope  를 따라서 그냥 공을 굴리는 건  not smart
smarter  way 는 공이 다시  slope 를 올라갈 것 같으면 점점 속도를 떨어뜨리는 것이다
로컬 미니멈에 도달 했을 때  momentum 이 매우 높을 것이고 그렇게 되면 높은  momentum 으로 인해  global minima 를 지나치게 될 수도 있다 ( Yurii Neterov)
1983  년  NAG 를 발표하게 된다
먼저  momentum  을 계산해서 크게 점프를 하고 수정을 한다. 이를 통해서  minima 를 놓치지 않도록 한다
V(t)=γV(t−1)+η∇J( θ−γV(t−1) ) 
θ=θ−V(t) 
 NAG  식을 보면   Momentum  에서 사용한 γV(t−1) 를 기존의  parameter 에 먼저 뺴준 뒤 그걸 미분을 한다. 즉, 과거의 위치를 미분해서 빼는 것이 아니라 미래에 예상되는 포지션을 미분해주는 것이다
이를 통한 장점은,  momentum 을 크게 줘서 움직일 경우, 그리고 그  momentum 으로 인해  minima 를 놓쳤을 경우, 다시 반대방향으로 작용시킴으로써 좀 더 미래를 미리 알고 움직일 수 있다는 장점이 있다.
 
 
 
 Adagrad
learning rate  를  parameters 를 토대로  adapt !
 infrequent parameters ->   big  업데이트,  frequent parameters -> small update
그래서   sparse data 에 잘 맞음
 theta t+1, i  :   t+1  번째  step 의  i 번째  weight 를 의미함
이전의  weight 에서 앞의 식을  각  gradient 에 곱해줌
 
  단점

learning rate is  decreasing and decaying
 보면   denominator 에  squared gradients 가  쌓이는데 양수이기 때문에  learning rate 가 계속 감소함





AdaDelta
accumulate 되는  past gradients 들의  window  사이즈를 제한함
이전의  gradients 들이  모든 이전의 squared gradients 의 decaying mean 으로 정의함
 E[g²](t)=γ.E[g²](t−1)+(1−γ).g²(t) - 갈수록 현재의 선택에 집중하는 결과?
여기에서  y 는  momentum  과 유사하게  fraction  역할을 함

장점 : 초기  learning rate 를 설정할 필요가 없다

Adam (Adaptive Moment Estimation)
 exponentially decaying average of past gradients M(t) similar to momentum
M(t) : mean , values of the first moment
V(t) : uncentered variance of gradients 
매우 빠르게 수렴




https://towardsdatascience.com/types-of-optimization-algorithms-used-in-neural-networks-and-ways-to-optimize-gradient-95ae5d39529f
