 Covariate shift ( internal Covariate Shift)
https://app.additor.io/p/4ggua2wm
: 학습할 때마다 각 층의 출력 분포가 바뀌는 것

 입츨략의 생선 규칙은 훈련과  test 시 다르지 않음
하지만   입력의 분포가  training 과 test 시에 다름
처음에 평균 0 분산 1로 선형변환하면 입력층으로 가는 입력의  distribution 은 잘 유지되지만

중간층에서의  input 은 각층에서   밑층의  parameter에 따라서 중간층의 input distn 이 변화한다.
