## Hash Table 
* Key - Value 대응 
* How to implement? 
	* Linked list and hash code function 
* Hash code(index)? 보통 hash function에서 반환된 고유의 숫자 값을 의미한다. 
* 좋은 hash function? 
	* 무조건 1:1 대응이 좋은가? 가능한가
	* Collision 대응 방식
		1. Open Address 
			* 비어있는 다른 bucket을 찾아 삽입하는 방식 
			* 최악의 경우 모든 버킷이 꽉차서 다시 넣으려던 자리로 돌아올 수 있음 
			* Linear probing : 순차적으로 비어있는 bucket 탐색 
			* Quadratic probing : 2차 함수 사용
			* Double hashing probing : 2차 hash function 사용 - 위의 방식보다는 연산이 많음 
		2. Separate Chaining 
			* Linked list : Collision 발생시 해당 bucket의 list에 추가하는 방식. 단점? 작은 데이터를 저장할 때 연결리스트의 오버헤드가 부담이 될 수 있음. 
			* Tree 
1. Key의 Hash code를 계산한다. 보통 int, long이 될 것이다. Int의 개수는 유한하기 때문에 서로 다른 두개의 키가 같은 hash code를 가질 수 있다
2. Hash(key) % array_length - 배열의 index를 구한다 
3. 각 index에 키와 값을 저장한다. 충돌이 발생할 수 있기 때문에 linked list를 이용한다 
	* 서로 다른 두 키가 같은 해시 코드를 가지거나 두개의 해시 코드가 같은 인덱스를 가리키는 경우를 말한다 

Worst case runtime 은 O(N) 모든 키끼리 충돌이 발생할 경우를 가정 
일반적으로 잘 구현되었다면 O(1)

Balanced binary tree에 저장할 수 있다. 탐색 시간은 O(logN)이지만 큰 배열을 미리 할당하지 않아도 되어 잠재적으로는 적은 공간을 사용한다. 


ArrayList , 가변크기배열 
Java에서는 고정된 길이의 list를 선언해야하고, 어떤 언어에서는 list를 가변적으로 사용할 수 있다. 
동적으로 크기가 변하는 배열과 비슷한 자료구조를 사용하고 싶다면 *array list* 를 사용한다. 

### 상환 입력 시간 
크기가 N인 배열을 생각했을 때, 그 배열의 크기를 2배씩 키우기 때문에 마지막 복사에서는 N/2만큼의 원소가 복사되었을 것이다. 
N/2 + N/4 + ... + 2 + 1 = O(N) 
모든 copy of elements 는 길어봤자 수행시간이 N 이다. (N, 제논의 역설? )
원소를 넣을 때마다 복사하는 것이 아니니 평균적으로는 *O(1)* 이 소요된다.





### References 
Cracking the coding interview
https://k39335.tistory.com/18