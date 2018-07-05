discrete 한 단어들의 벡터를 dense한 real vector로 만들자

n-1개의 단어가 나왔을때 n번쨰 단어가 나올 확률- ngram model
log bilinear model - neural language model but simple - linearly combining the representations of the context words
1부터n-1 개의 단어와 앞에 C를 linear 하게 곱한후 합으로 나타냄


glove 란
기본적으로 단어들 사이에 co-occurrence matrix X를 만든 후, 각 단어의 weight w_i, w_j의 내적이 log X_ij 와 최대한 유사해지게 만드는 weight 들을 구하는 방식이다.
