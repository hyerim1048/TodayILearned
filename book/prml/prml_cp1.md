## 1. intro

* training set (x들의 집합) -> target vector (x:t= 1:1)
* traning phase/learning phase 
* **generalization** to test set 
* preprocessed/feature extraction (e.g. 숫자 변환, 축소, 확대)
* dimensionality reduction (e.g. 비디오 화질 낮추기 -> 정보를 잃어버리게 될 수도 있음) 

* supervised learning 
  * classification or regression 
* unsupervised learning without target vectors 
  * clustering, density estimation, visualization 
* reinforcement learning : 주변과의 상호작용을 통해 일어나는 상태와 행동들이 주어지고 보상을 제공 
  * credit assignment : 보상을 적절하게 분배해야 함 
  * tradeoff between exploration and exploitation : 탐사 - 새로운 종류의 행동을 시도해서 효과적인지 확인 / 이용 - 시스템이 높은 보상을 주는 행동을 시행 

### 1.1. example 
* error function 
* model comparison and model selection 
* over-fitting 
* 피팅의 목표는 새로운 데이터에 대해 정확한 결괏값을 예측할 수 있는 좋은 일반화를 달성하는 것이다 
* Root mean square error - maximum likelihood 
  * 베이지안에서는 데이터 집합의 크기에 따라 적합한 매개변수가 자동으로 정해진다 
* regularization : error function의 계수의 크기가 커지지 않게 페널티항 추가 
  * called as shrinkage method like ridge regression in Stats  / weight decay in NeuralNet
  * 정규화항에 곱해진 lambda의 크기를 조절해서 제약의 정도를 정하는데 너무 커도 안좋고 없으면 overfitting 을 하려고 값이 발산하게 됨 

### 1.2 확률론 
* 불확실성/ 완전하지 않은 제약 조건 하에서 최적의 예측을 하자 
* sum rule
* product rule 
* joint probabilty 
* with sum rule, get marginal prob. from join prob. 
* conditinal prob. with product rule p(X,Y) = p(Y|X)p(X)
* bayes theorem  with p(X,Y) = p(Y,X)
  * bayes theorem에서 분모는 정규화 상수의 역할을 한다. 값의 합을 1로 만들어주는 역할 
  * prior prob. : 어떤 것이 선택되었는지 알기 **전**에 어떤 박스를 선택할 확률 p(B)
  * posterior prob : 오렌지라는 것을 알게 된 **후** 어떤 박스를 선택할 확률 p(B|F)
* independent : 상자가 같은 값의 과일의 수를 가지고 있다면 p(F|Box) = p(F) box를 고르는 것과는 상관이 없다.
 

