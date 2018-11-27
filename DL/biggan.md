## Large Scale GAN Training  
by DeepMind 인턴

### Introduction
* GAN 은 좋지만 처음 setup에 민감하게 학습된다.
* 이 논문에서는 GAN으로 생성된 이미지와 실제 이미지의 간극을 줄이고, diversity 와  fidelity를  control할 수 있는 방법들을 소개함
    * 기존의 모델에서 parameter 사이즈를 4배 키우고, batch size 를 8배 키워 트레이닝 했으며, 2개의 간단한 아키텍쳐 변화를 주었음
    * 그리고 regularization 스킴을 고침
    * 그로 인해서 simple truncation trick 을 통해  diversity와  fidelity 사이를  control 하게 되었으며
    * 그로 인해 발생하는 불안정성을 경험적인 방식으로 줄임

### Background
#### GAN
* random noise 로 부터 이미지를 mapping 하는 Generator 와  Discriminator 가 존재하며
* 보통  random noise 는 정규분포나 uniform 을 따르게 했었음
* 그리고 각각은 보통  convolution 을 사용해서 모델링함
* Spectral Norm
* SA-GAN
* how to condition GAN

### Scaling Up GAN

* Baseline : SA-GAN with hinge loss + G with class-conditional Batch Norm + D with projection + 기타 세팅 여러 논문들 따름
* 처음에 Batch size 를 무조건 늘림! 짧은 시간에 수렴했으나 트레이닝이 망가짐
* number of channel 을 늘리고,  parameter 수를 늘림
* conditional BN layer 에 사용되는  class embedding 들을 각 layer 가  share 하도록 함. 메모리 코스트, 성능 향상
* noise vector z를 각  layer 에 넣음 ( 원래 보통 처음에만 넣지만)
* 

* 
 

BigGAN

Spectral Normalization for Generative AN

progressive GAM은 단계적이지만 단계적이지 않게 사용 가능하다

architecture
regularization
truncation trick

실험을 여러개 햇으나 
어떤게 포인트다라는걸

Shared Embedding
 트레이닝 스피드 빨라짐

	* 
임베딩 벡터를 끼워 넣는다.
	* 
감마와 벡터





Hierarchical latent space
* noise vector z를 여러 multiple layer로 쪼개서 레이어마다 넣고
