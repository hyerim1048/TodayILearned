# Bit vector 
* Bit vector 는 중복도지 않는 정수 집합을 비트로 나타내는 방식이다. 
* 정수 집합을 표현할 때 최대 범위가 0 ~7이면 1Byte 의 공간만 사용해서 데이터를 저장할 수 있다 
* 값이 있으면 1, 없으면 해당 index에 0
	* 0 1 1 0 0 0 1 0 0

## 비트 연산자 
### << left shift , >> right shift
* Left shift : 연산자의 왼쪽에 위치한 비트 값을 오른쪽에 위치한 수만큼 왼쪽으로 이동시킵니다 

## Python bit vector 
1) Int 에 bitwise operator를 실행할 수 있다 
``` python
X = 0 # empty 
X |= 1 << 19 # set bit 19 
X &= ~(1<<19) # clear bit 19
X ^= 1<<19 # toggle bit 19 
X = ~X # invert all bits 
Mask = ((1<<20) - 1) # define a 20 bit wide mask 
X &= Mask # ensure bits 20 and higher are 0 
X ^= Mask # invert only bits 0 through 19 

```

### References 
https://cjh5414.github.io/bit-vector/ 
https://stackoverflow.com/questions/2147848/how-do-i-represent-and-work-with-n-bit-vectors-in-python