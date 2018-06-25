MC 방식은 episode가 끝나야 학습 가능.
DP처럼 time = step마다 학습할 수는 없을까?
MC + DP
The TD method is called a "bootstrapping" method, becuase the value is updated partly using an existing estimate and not a final reward.



Sarsa Algorithm : TD method 에서   value -> action value f 로 바꿈.



 on - policy 는 학습한  policy 로 움직이는 것

 off-policy 는 움직이는 policy와 학습하는  policy 를 분리함



Q learning
epsilon greedy policy  를 통해서  최적의  policy 를 찾되, 최적의  action 은  greedy policy 를 통해서 학습 진행.

지금껏 배운 함수들은 모두  gridworld 유한한 세계를 가정하지만 실제 세계는 그렇지 않음

그래서  w 라는 parameter 를 도입하고 머신러닝과 같이  stochastic gradient  방식을 사용해 학습을 하게됨.

 Error 는 실제  value function 과 approximated value function 의   차로 잡으면 되는데  approximated 는  TD target 이나  sample 의  return 값을 사용
