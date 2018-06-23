### Reward  두가지가 있음.

small living reward each step (can be negative)
big rewards in the end
 한  step 마다  negative reward 를 크게 주면, 그냥 아무데나  exit 하게 됨
  negative reward 를 너무 적게 주면 돌아돌아 정답으로 감. 적절한  reward 가 중요.


### offline learning
실제  game 을  play 하지 않고  value 를 계산해서 답을 구함.
### online learning
 실제 게임을 하고 답을 찾아감
 MDP 에서  Transition 에 필요한  probability parameters 를 모르면, 
  online learning  즉   강화학습만 가능함.


### Value iteration Programming

 먼저 모든  grid 에서 첫  state  의  value function 을  0 으로 기록
아래의 식을 이용해서  Action 을 했을 때에   Probability 에 따라 갈 수 있는 state 의  discounted  합과 즉각적으로 받을 수 있는  reward 를 더함
그 중 가장 큰 값을  value 로 넣어줌.
 iteration 이 끝날 때까지 반복함.

