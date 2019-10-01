# Multi-Armed Bandits

Created: Oct 02, 2019 12:56 AM
Project: Datarize
Topic: Math

# Exploration and Exploitation

## Greedy

- 여러 번 시행을 하고 제일 보상이 높은 것을 선택한다.



## Epsilon-greedy

그리디가 항상 완벽하지는 않다.

- Greedy 전략에서 탐험을 좀 더 해보는 알고리즘으로
- 랜덤한 확률로 이전의 경험을 토대로 제일 좋았던 머신을 선택하고 나머지 확률로는 새로운 기계를 탐색한다



## Upper-Confidence-Bound

- 탐험을 랜덤하게 하지는 말자
- 머신을 선택할 때 모든 머신을 선택한 횟수를 특정 머신을 선택한 횟수로 나눈 값을 전체 보상에 더해준다.
- 즉 해당 머신을 많이 선택했다면 그 값은 작아져 새로운 머신을 탐색할 가능성이 조금은 늘어난다.



출처 : 

[멀티 암드 밴딧(Multi-Armed Bandits)](https://brunch.co.kr/@chris-song/62)
