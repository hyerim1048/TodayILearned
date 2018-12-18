### batch matrix multiplication
 파이썬에서 배치를 포함한 3차원 매트릭스의 각 배치 별 multiplication 을 실행하는 함수이다.
 
 ```
 # Batch Matrix x Matrix
# Size 10x3x5
batch1 = torch.randn(10, 3, 4)
batch2 = torch.randn(10, 4, 5)
r = torch.bmm(batch1, batch2)

 ```
 
 * 각각의 matrix 곱을 batch 안의 각 데이터마다 수행한다.
 
 참고: https://jhui.github.io/2018/02/09/PyTorch-Basic-operations/
