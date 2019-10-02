# Offline evaluation

### Explicit ratings

- low prediction erros (RMSE/MAE) and high Recall/Catalog coverage
- split validation (e.g. train 80%, test 20%) 나눈 후에
- explicit 한 유저의 rate가 있을 때 실제 rate를 predict 하고 그 값의 차를 구해보는 것 RMSE
- 단점 : 이런 명시적인 데이터가 현실세계에는 없을 가능성이 높음

### Implicit ratings

- 구매내역과 같은 것을 unary ratings (0,1) 과 같은 조건으로 바꾸고 test 진행하기

### Recall

- 유저의 구매내역의 일부를 숨기고, 모델을 통해 그 구매내역을 맞추게 함
- 실제로 4개의 구매내역 중 몇개를 맞추었는지를 확인함
- 단점 : 어떤 정답을 숨길껀지, business의 목적이 무엇인지 생각해봐야함. 예를 들어 유저가 한 TV 시리즈에 대해 20개의 에피소드를 봤다고 했을 때 1-17까지 본 유저에게 18-20 을 추천해주는 로직은 매우 쉬움.

### Catalog Coverage

- 단순히 잘나가는 아이템을 올려놓는 것도 recall 상승에 도움이 됨. 브랜드 충성도를 유지시키면서 얼마나 많은 상품을 유저에게 전달하는지도 중요한 지표중에 하나가 될 수 있음.
- 단순히 계산하는 방법은
    - test user에 대한 추천 상품 합 중에서 교집합이 얼마나 되는지를 확인하는 방법도 있음
    - 그럼 bestseller 모델은 항상 똑같으니까 zero coverage 임

# Online evaluation

- split-validation 대신에 A/B 테스트를 하자
- user id 해싱이나 GA같은 툴을 써서 유저군을 나눈다

### CTR and CR

- 단순히 CTR을 높이는 것은 좋지만 content 가 서비스 브랜드를 떨어뜨리지 않는지는 생각할 필요가 있다.

### empiric evaluation

- QA 팀의 노력이 필요함

### Return of Investment (ROI)

### CLV

출처 

[Evaluating Recommender Systems: Choosing the best one for your business](https://medium.com/recombee-blog/evaluating-recommender-systems-choosing-the-best-one-for-your-business-c688ab781a35)
