* WGAN : Weight Clipping
    * Wasserstein Distance  : https://www.slideshare.net/ssuser7e10e4/wasserstein-gan-i
* WGAN-GP : Gradient Penalty
    * real 과 fake 의 gradient space의 중간에 있는 어떤 data 를 가지고 loss를 구함
* SN-GAN : Spectral Normalization
    * point-wise 한 제약이 아니라 Gradient Space 자체에 대한 제약을 걸고 싶다.
    * Matrix Normalization 개념 사용
* Spectral Normalization (Matrix Norm 2)
Singular value의 최대값 = Spectral Norm
결국 각 layer 의 weight를 spectral norm으로 나눠주는 방식.
[PR12] Spectral Normalization for GAN :
https://www.slideshare.net/thinkingfactory/pr12-spectral-normalization-for-generative-adversarial-networks
SA-GAN : Self Attention + Spectral Normalization
https://towardsdatascience.com/not-just-another-gan-paper-sagan-96e649f01a6b

#### 기타 논문에서 언급한 것들
* Class Conditional BN 
    * Batch Norm 곱해지고 더해지는  beta, r  에  conditional embedding 을 더해줌
    * (2017  NIPS에서 처음 나옴)
    * 논문 : https://arxiv.org/pdf/1707.00683.pdf
    * 참고 : http://tmmse.xyz/2018/04/12/normalization-layer/
* Cross replica BN
    * batch statistics 가 전체 device에 걸쳐 aggregation 됨. (not only standard device)
 
