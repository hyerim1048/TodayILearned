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



https://towardsdatascience.com/types-of-optimization-algorithms-used-in-neural-networks-and-ways-to-optimize-gradient-95ae5d39529f
