
https://stackoverflow.com/questions/25122798/how-to-manage-multiple-positive-implicit-feedbacks

답변 1.
 보통  IMplicit feedback 을  explicit rating 으로 변환하는데,  유저가 같은  item 에 대해 같은 행동을 반복하면 선호가 증가한다고 가정함.  

multiple implicit feedback 을 모델링하기 위해서  numeric rating mapping function 을 만듦.  k of implicit feedback increases, rating 에  매핑된 값이 증가하게끔 함.

e x. k=1 이면  rating 의 최소값을 주고,  k 가 증가하면 1이 되게 만듦. 또는  rating  이 0 ~ 1 이어도 상관 없음.


2. 클릭의 합을 사용하거나,  event 들의  weighted sum 을 스코어로 사용함. 

ALS (alternating least squares)


