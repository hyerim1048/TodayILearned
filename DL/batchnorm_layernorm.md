One of the challenges of deep learning is that the gradients with respect to the weights in one layerare highly dependent on the outputs of the neurons in the previous layer especially if these outputschange in a highly correlated way.

딥러닝에서 한 alyer 의 gradients 는 그 전 layer 의 output에 크게 의존함. Batch Normalization은 이런 convariate shift를 방지해주고, 각 hidden unit에 들어가는 input들을 Nomalization해줌

반면, layer normalization은 batch size와 상관없이 hidden unit들을 정규화 시켜줌. 배치 정규화의 아이디어에서 나옴.


(아직 정리중)
