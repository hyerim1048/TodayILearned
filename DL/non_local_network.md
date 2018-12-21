

box filter
* P : original value 와 Q: 주변값 과의 거리를 가우시안 필터에 넣고 q값을 곱해서 더한다
bilateral filter
* 가우시안을 쓰면 이미지가 뭉개지는 경항이 있으니, 색깔의 유사성까지 구해서 곱한다

non local block
* p patch 와 주변 영역들에서 랜덤하게 뽑은 q 패치의 유사도를 구하는 함수와 p의 값을 곱한다.
* self attention도 non local block 의 special case 라고 볼 수 있지 않을까?
local block 도 non local block 의 local 화된 버전
