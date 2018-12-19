### A Structured Self-attentive Sentence Embedding

* setence embedding 을 워드 임베딩의 평균이나 간단한 방식이 아닌 self-attention으로 표현해보자

* 문장 S 는  n개의  d차원짜리 word vector로 이루어져 있다. 즉, n * d.
* 여기에 bi-lstm 을 적용하여 hidden vector를 나열한다. n * 2u : bi-lstm이니까 양방향 concat해서 2배




출처 : http://keunwoochoi.blogspot.com/2018/08/structured-self-attentive-sentence.html
https://arxiv.org/pdf/1703.03130.pdf
