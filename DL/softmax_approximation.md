# Sampled softmax
* Softmax 비용이 너무 크니까! 대체할 방법을 찾아보자
ruder.io/word-embeddings-softmax/index.html


## Softmax-based Approaches
### Hierarchical Softmax (2005)
* Inspired by binary trees
* At least 50 x faster

## Sampling based Approaches
* Normalization in the denominator of the softmax 를 계산하기 쉬운 다른 loss로 대체한다
* 하지만 training time에서와 달리 inference에서는 여전히 full softmax를 요구한다는 단점이 있다

* Training 에서 보통 모든 단어 w에 대해 cross-entropy loss를 줄이게 되는데,
* => negative logarithm of the output of softmax

### Cross-Entropy and Softmax
[Karpathy’s explanation ](http://cs231n.github.io/linear-classify/#softmax-classifier)

For back-propagation -> objective function 의 gradient를 구해보자


* Loss function에서 softmax function P(w) 를 가지고 다음과 같이 식을 정리할 수 있다.


* 이 식을 최종적으로 정리해보면 , objective function 인 cross entropy는 다음과 같다.

* 첫번째 항은 target word w 에 대한 positive reinforcement 와 나머지 word에 대한 negative reinforcement (weighted by their probability)로 이루어져 있다는 사실을 확인할 수 있다.


/"the Crux of Most sampling-based approach : approximate this negative reinforcement in easier ways to compute"/

### Importance Sampling
* Monte Carlo method 를 사용해 random samples의 expectation을 구하자
* 확률분포는 계산을 쉽게하기 위해서 uniform distribution을 따른다고 가정하자

### Noise Contrastive Estimation
* 단어의 확률을 추정하지 않고 다른 loss function을 사용한다
* Reduce the problem to a binary classification task!
/Train a model to differentiate the target word from noise/

Importance Sampling 처럼 uniform distribution 을 따른다고 가정하고
Unigram 을 Sampling 한다 . 그리고 정답은 1 나머지 noise는 0으로 label을 세팅한다  - binary logistic regression

Loss function은 어떻게 될까?


* Expectation을 구하기는 어려우니 monte-carlo approximation으로 평균을 구한다
* 

### Negative Sampling

* This is true when K = the size of vocabs and Q is a uniform



### Sampled Softmax
[On Using Very Large Target Vocabulary for Neural Machine Translation](https://arxiv.org/pdf/1412.2007v2.pdf)
-> *Approximate learning aproach to very large target voabulary*

* Use only a small subset V of the target at each update



* By importance sampling with a small number of samples
