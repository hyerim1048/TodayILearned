Planning vs Learning
planning - model 을 알고서 문제를 푸는 것 ( ex. DP)
learning -   model 을 모르지만 상호작용을 통해서 문제를 푸는 것 (Reinforcement Learning)


Policy iteration
one step backup -> 각  step 별로  value  function 값을 구함.
prediction  과 control  두 단계를 가짐.
 prediction =  evaluation 과정으로   주어진  policy 를  무한대까지 따라갈 때 얻는 value function 의 값
 처음에 정책이 없을 때에는 random  and uniform- distributed policy 를 따라서 값을 구하기도 함.
 control =  policy improvement 단계,  value function 값을 토대로 더 나은  policy 를 찾음. 
 
 Value iteration
 evaluation 과 improvement 를 동시에 진행.
취할 수 있는 action 중에  value function 이  max 가 되는 action 을 취함.
