Attention

* sentence representation
* cannot cram the meaning of a whole setence into a single vector
* -> 중요한 부분에  attention하게 만들자!
* 만약 학습이 잘 되었다면
* encoder 에서  bier 를 표현하는 벡터와  decoder 에서  beer를 표현하는 벡터는 유사할 것이다. (번역문제 예시)
(https://ratsgo.github.io/from%20frequency%20to%20semantics/2017/10/06/attention/)

Attention

* encode :  each word in the sentence into a vector
* decode : linear combination of word vectors weighted by attention weights

* query vector (decoder state)
* key vector (all encoder states) (=  value vector)
* query-key pair : calculate weights

* 요새는  encoder, decoder 가 아니라  self attention 많이 사용하고 있음
* weghted sum 으로  value vector 를 합침 - 모델의 어느 부분에서나 써도 상관 없음


Attention Score Fucnction


multi-layer perceptron

* query 와  key 를  concatenate 를 한 후,
*  W 를 곱하고 ,  nonlinearity  함수 ->  weight 를 한번 더 곱해줌
* 큰 데이터에도 잘 돌아감

 Bilinear
query * weighte * key

dot product

query . key 

scaled dot product


google self attention 에서 나오는  Score Function 으로,
 Dot Product 를 한 후  root(k)  로 나눠줌

장점 :   내적은  dimension 이 클 수록 값이 커지는데 그것을 방지하기 위해서 디멘전 크기만큼의 루트를 나눠줌


