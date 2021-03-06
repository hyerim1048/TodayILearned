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
 


###  Models and Algorithms

 모델은 간단하다. 
 각  item 이 카테고리를 가지고 있다고 해보자.
  Customer ID, Category ID, Preference Score 테이블을 만든다.
  
  유저가 할 수 있는 행동은 다음과 같다.
  *  첫 가입 때 관심 카테고리 설정
  * 구매
  *  Interest Expression - 클릭, 웹페이지 방문, 장바구니 등록 등등
  
  Preference Score =   alpha1 *  프로필 설정 +  alpha2 *  구매 +  alpha3 * 클릭 ....
  
   alpha 값은 중요도에 따라 다르게 설정해준다.
   
   그리고 새로운 행동을 할때마다  alpha 만큼 실시간으로 더해준다.
   
 
    Selection
    *  광고는 이  preference Score 를 바탕으로 제일 높은 카테고리의 아이템을 추천해준다.
    
      만약  Affinity 를 반영하고 싶다면,  upper category 의  Preference Score  를  Average   of descendent Category 로 잡고, 그 값을 각   자식  category 카테고리로 넣어준다. (단, 자식 카테고리의  PS 가   부모의  PS 보다 높다면 반영하지 않는다.)
      
      이는 같은 부모 카테고리 내에 있는 다른 카테고리의  Score 도 높을 것이라는 가정하에 정한 것이다.
      
      
      https://ac.els-cdn.com/S089571770500511X/1-s2.0-S089571770500511X-main.pdf?_tid=08ce5ee3-f1f9-45fd-bcfc-e5890ed11642&acdnat=1534343594_4964df7a3fe4decaa8f72474938e069e
