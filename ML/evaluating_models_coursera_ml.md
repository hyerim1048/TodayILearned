https://app.additor.io/p/ZXJ9yIXM

how to select a good model ?

In Linear Regression,
Get    more    training    examples    
 Try    smaller    sets    of    features   
Try    additional   features    
Try    adding    polynomial    features   
Try    decreasing    regularization parameter
Try    increasing regularization parameter


to get a well-generalized model,

polynomial  feature 를 언제까지 추가할 것인가? 
test  error 가 낮은  model 을 선택한다면,? test error 를  generalization error 로 보기 힘듦. ( because An extra parameter (d, the degree of the polynomial) has been fit to the test set.)
 Cross Validation : dataset 을  3 가지로 나눔. (training set(60%), test set(20%), cross-validation set(20%))
Training set 으로  train  한 후,  Cross Validation error 가 낮은 모델을 선택 ->  test set 으로  generalized error 측정
이 경우에,  cross validation error <=  test error  


 Bias vs Variance
High Bias (Underfitting) 

* CV error  와  train error 가 비슷함

 High Variance(overfitting)

CV error >> train error
