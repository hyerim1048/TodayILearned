## Unsupervised Anomaly Detection with GAN 

### Purpose 

* 정상치와 에러와의 거리를 GAN으로 detection 하자
* abnormal 데이터가 너무 적음

### Motivation

* 의료 논문을 기준으로 함
* 하나의 종양만 detection하는 것이 아니라 정상 데이터와의 차이를 GAN으로 파악해보자

### Preprocessing
* 영상 프레임을 잘게 64단위로 자른 후 random-crop을 함

### loss 설명
* Residual Loss : pixel 단위로 real과 fake image 와의 차이
* generator가 학습한 것과 abnormal image를 discriminator에 넣었을 때 feature의 차이
* random sampling을 보정하기 위해서 gradient descent 를 전달함. z 값까지 total loss로 보정 (z학습 시에 다른 것들은 다 fix하고 전달)

### scoring
* score = residual + discrimination

### result
* AUC , recall 과 precision을 사용함




