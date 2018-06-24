DP 는  Bellman Equation 을 통해서   optimal 한 해를 찾아내는 방법으로써

 Full width Backup 을 수행해서   비용이 비싸고

 Full knowledge about Environment



 model-free prediction: 현재의  policy 를 바탕으로  sampling  을 통해  value function 을  update 하는 것
policy update 까지 하면  model-free control


Monte-Carlo
episode 마다  update 하는 방법
Temporal Difference
 Time step 마다 update 하는 방법

https://dnddnjs.gitbooks.io/rl/content/temporal_difference_methods.html

### monte carlo control

#### value function
 value fuction 대신 action value function   사용함

####  Exploration

   epsilon greedy  방법 사용
 epsilon 이 1이면  random 하게 액션 선택하게 되고, 0이면  greedy action 에 100%   수렴. 그 사이값을 사용

####  policy iteration
 한 번  evaluation 한 다음에 policy improve 해도 optimal 로 수렴
