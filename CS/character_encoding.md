# 들어가기 앞서 
* 컴퓨터의 기본 저장 단위는 byte = 8-bits 이다 
* 1 byte는 2^8 즉 256개의 고유한 값을 저장할 수 있다
* 문자나 기호들을 컴퓨터에서 저장하려면 부호로 바꿔야 하고 이를 encoding이라고 한다. 부호화된 문자들을 복원하는 것이 복호화이다 
 

# Unicode and ASCII 
* ASCII, Unicode = two character encodings 

## ASCII (American Standard Code for Information Interchange)
* Used 7 bits to encode each character (그 때에 1bit를 통신 에러 검출에 사용했다고 한다 = Parity Bit)
* Increased to 8 bits with Extended ASCII : *Ansi Code*
* 1 byte로만 표현되는 경우를 Single Byte Character Set 이라고 한다 

## Unicode 
* A Variable bit encoding program (can choose 32, 16, 8-bit encodings)
* Using more bits : file의 크기는 더 커지지만 다양한 캐릭터를 사용할 수 있다 
	* 적게 쓰면 공간 낭비를 줄일 수 있다
	* 그래서 영어를 encoding할 때에는 UTF-8 과 ASCII 가 제일 좋다 
* 하지만 세상의 모든 언어를 담기 위해서, (특히 한글의 조합은 무수히 많다.) 표준 언어 코드로 등장한 것이 unicode 이다. 
* UTF-8은 저장될 때 영문, 숫자는 아스키 코드와 똑같이 1 byte를 사용하고 한글은 3바이트로 파일에 저장된다 
* 영문만 있을때의 utf-8과 ascii 코드는 호환이 된다 
* 

### References
[Difference between unicode and ascii](http://www.differencebetween.net/technology/software-technology/difference-between-unicode-and-ascii/)
[아스키 코드와 유니코드의 이해](https://whatisthenext.tistory.com/103)
http://mwultong.blogspot.com/2006/10/unicode-ascii-unicode-ascii-difference.html 
