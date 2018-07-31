Intro

Dynamic memory network 에 대한 논문
가장 특징적인 것은 episodic memory 를 

input module
input text 를 받는다

word embedding -> 문장을 GRU encoding

Question module

마찬가지로 GRU 로 sentence embedding 을 한다


Episodic module
GRU 로 input 이랑 Question embedding 을 하나씩 sequence 로 넣고  state ->
