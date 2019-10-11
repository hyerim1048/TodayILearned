## mysql varchar와 text 길이 차이가 있었나? 

### TEXT
* 고정된 최대 사이즈가 65535 (2^16 -1) character 이다 
* 디스크에서 2 + c bytes를차지하고 있으며, c는 저장된 string의 길이이다 
* index 가 될 수 없다

### VARCHAR
* max size가 가변적이지만 그 사이즈는 1 ~ 65535 사이여야 한다
* 최대 사이즈가 255 이하이면 1 + c bytes 를, 65535 이하이면 2 + c bytes 를 차지한다
* index가 될 수 있다 


references
[stackoverflow](https://stackoverflow.com/questions/25300821/difference-between-varchar-and-text-in-mysql)
