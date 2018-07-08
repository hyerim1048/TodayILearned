module 의  parameter 인 텐서

 parameters 는  class: ~torch.Tensor 의   하위 클래스로  module 들과 함꼐 사용할 때 여러 특징들을 가짐

 module  의  attribute 로  assign 될 경우, 자동적으로 그  parameter list 에 추가 되며,  meth:~Module.parameters interator 에서 확인 가능함.



 그냥  tensor 를  assiginint 하는 것은 그런 효과가 엉ㅄ음.

일시적인  state 를  cache 하기를 원히가 때문  ex. last hidden state of RNN in the model



