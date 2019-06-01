### 데이터로 원인 파악하기 

Randomized Control Test 

- 항상 테스트를 하지는 못한다
- 데이터만 가지고 원인 파악할 수 없을까?
- potential outcomes
    - Average Treatment Effect : 모든 사람의 효과를 비교해서 평균구하기!
    - Spurious Correlation : 서로 연관없어보이는 데이터가 높은 연관성 보이는 경우
    - Simson's paradox : 그룹을 나뉘었을 떄와 아닐때의 결과가 정반대
        - because of cofounder
            - 그럼 데이터를 cofounder로 쪼갠다
        - cofounder가 아닌 경우는 ?
            - 원인과 결과의 중간 결론(?) 일 겨우에는 이 변수를 가지고 쪼개면 안된다.
    - perkson's paradox
        - 결과에 대한 조건을 걸  경우 원하지 않는 결과 발생 - collider
- Causal graphical models
    - 데이터가 그럼 어떻게 생성된걸까?
    - DAG로 인과관계 표현
        - Chain
        - Fork
        - Collider
    - P(Y|do(X)) ⇒ X를 변화 시켰을 때 Y가 얼마나 변하나?
        - not see! do! 상관관계 x 인과관계
        - 관찰하
    - front-door
    - back-door 
    
 
 ### konva.js 
 
 html 에서 canvas tag를 다룰 수 있는 javascript 라이브러리

[http://labs.junho85.pe.kr/24k-gold/](http://labs.junho85.pe.kr/24k-gold/)
 
 
 
 ### Text Classification 
 
 contents 

- bag of words
    - sparse 한 vector
- word2vec (CBOW) - continuous bag of words
    - dense vector를 만들자
    - + fastText : 단어가 아니라 음절 별로 !
- 단어의 순서를 생각하자
- LSTM
    - update를 계속하다보니 그 전에 나왔던 걸 까먹어
- CNN
    - 이 단어를 이해하려면 주변 몇개 보면돼
    - 분류에서는 잘됨
- Transformer (attention) - 2017
- BERT - 2018
    - using unlabeled data
    - 단어 퍼즐을 풀게 하자!
