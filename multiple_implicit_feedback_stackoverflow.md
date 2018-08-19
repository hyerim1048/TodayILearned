
https://stackoverflow.com/questions/25122798/how-to-manage-multiple-positive-implicit-feedbacks

답변 1.
 보통  IMplicit feedback 을  explicit rating 으로 변환하는데,  유저가 같은  item 에 대해 같은 행동을 반복하면 선호가 증가한다고 가정함.  

multiple implicit feedback 을 모델링하기 위해서  numeric rating mapping function 을 만듦.  k of implicit feedback increases, rating 에  매핑된 값이 증가하게끔 함.

e x. k=1 이면  rating 의 최소값을 주고,  k 가 증가하면 1이 되게 만듦. 또는  rating  이 0 ~ 1 이어도 상관 없음.


2. 클릭의 합을 사용하거나,  event 들의  weighted sum 을 스코어로 사용함. 

ALS (alternating least squares)



### Evaluating Various Implicit Factors in E-commerce
https://pdfs.semanticscholar.org/c7f9/da0b12cf13854cdbbbcb453777513ea38823.pdf
이 논문에서는 그냥  recommendation 을 여러 피쳐들로 해보고 제일 좋은 성능을 내는 피쳐를 쓰라고 얘기함.




### Fuzzy Set
https://www.researchgate.net/profile/Ladislav_Peska/publication/286216792_Modelling_User_Preferences_from_Implicit_Preference_Indicators_via_Compensational_Aggregations/links/5791d94008ae33e89f74e4b0/Modelling-User-Preferences-from-Implicit-Preference-Indicators-via-Compensational-Aggregations.pdf

 어떤집합이 속하거나, 속하지 않거나 (0  or 1) 로 표현하기 보다 [0,1] 실수값으로 표현하여, 애매모호( fuzzy)  한  set 을 수학적으로 표현하려는 학문이  fuzzy theory 이다.

  multiple feedback 을  0~1 사이의 실수값으로 나타내고 싶다고 할 때 이 이론을 적용해본다고 하자.   indicator ( 유저의 지표 하나하나) 한개가  D -> [0,1]  에 속한다고 할때, 우리는  indicator 전체의 곱을  a preference cube [0,1]   사이의 값의  N 승으로 표현할 수 있다. 
2번째 스텝에서,  (global preference) local preference  를   @:[0,1]^N -> [0,1]  로 바꾸는  aggregation function 을 이용한다. 

local preferences  :   각 implicit indicator 의  domain 안에서  user rating 을 포ㅕㅎㄴ한다. 모두가  numerical 하기 때문에  rating 과  implicit indicator 사이의 관계를  regression method 를 통해서 모델링할 수 있다. 

global preferences :    weighted average 가 가장 흔한 접근일 것이지만  좋은 선택지는 아니다. 하나의  bad  value 가  user 의  preference 를 크게 낮추기 때문이다.    decision making 이나  fuzzy system 에서도 많이 알려져 있는 문제이다. 그래서  S-norm 이라는 것이 제안되었다. 하지만  S-norm 은 너무 유저의  preference  를 과대평가한다. 그래서  T-norm 과  S-norm 을 섞는다.

polarity  는 각  local preference 가   평균보다 크면 1, 작으면 -1 이다.
c : intensity 는   평균과 각  local preference 가 떨어진 정도이다
polarity 의 평균은 이 각  local preference 의  polarity 와  intensity 의 곱으로 나타낼 수 있다.
->   polarity 가 높으면  S-norm( 과대해석)   을 더하고  t-norm 은 덜 사용될 것이다. 

갑자기  lambda  가 나오는데 이게 뭔지 모르겠다.
http://www.btluke.com/fuzzy01.html?

