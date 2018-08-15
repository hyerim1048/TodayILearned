## A preference scoring technique for personalized advertisements on Internet storefronts

 인터넷 광고 추천을 위한  preference scoring technique  을 소개한 논문이다.
 
 ###  Introduction
 
  추천을 위해 그 당시(2006)에 유행했던 몇 가지 추천 기술들을 나열하고 있다. 
  
  * rule-based approach
    * 먼저 특정 조건을 만족하는 고객들을 그룹화하여 같은 광고들을 보여주는 방식으로, 
    * 같은 그룹 내에서도 개인의 선호는 다르기에 효과적이지는 않다. 
  
  * data mining techniques
    * rule-based approach 는 마케팅 전문가의 규칙이나 기존의 지식에 의존하기 때문에, 
    * 이를 해결하기 위해서  decision tree  나  association rule generation technique 과 같은 데이터 마이닝 기법들도 도입되었다.
     
  * Collaborative Filtering 
     * 해당 고객과 행동이 유사한 고객의  choice 를  recommend 한다. 
     * 새로운 고객이 들어오면, 그 고객에게 개인화된 광고를 보여주기 위해 많은 아이템에 대한 선호도를 미리 파악해야 하기 때문에 한계가 있다.
     * 또한, 새로운 광고나 제품이 들어오면, 그 상품에 대한 고객들의 선호도를 먼저 많이 수집해야 한다.
 

