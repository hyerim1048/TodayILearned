
CF, CB, 기계학습 등등을 혼합해서 사용하고 있음
맥락에 따라 달라지기 때문에 여러 모델 필요함 
## CF 
사용자 preference 를 직접 사용하기 때문에 추천 결과가 우수하나 , popularity bias 와 상이한 콘텐츠 추천 등의 단점이 발생할 수 있다
SIMD, GPU 를 통해 알고리즘을 빠르게 만들거나 negative sampling으로 최적화 연산량을 줄임
## CB 
유사한 콘텐츠 추천해주기 
비슷한 음악을 추천하려면 파형 분석을, 기사 추천을 위해 NLP 기술 등을 사용해 분석
word embedding , LDA 같은 topic modeling 도 고려할 수 있다 
어떻게 잘 조합할까? (Ensemble Method)
rank aggregation 알고리즘 
reciprocal rank fusion, comb mnz 
사용자 반응을 확인하기 → MAB
## MAB 
이를 위해 Thompson Sampling 


