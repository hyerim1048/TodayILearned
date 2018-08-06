https://www.shellscript.sh/tips/shift/

space도 인자로 받고 싶다
```
#!/bin/bash 
HOST=$1 
USERNAME=$2 
PASSWORD=$3 
echo "Host is $HOST ; Username is $USERNAME ; Password is $PASSWORD"
```
이 코드에서는 두번째 arguments까지는 그냥 받고
두개의 parameters를 ditch
$@ 통해서 남은 모든 arguments를 다 가지고 옴

#!/bin/bash 
HOST=$1 
USERNAME=$2 
shift 2 
PASSWORD=$@

* 그런데 이렇게 하면 문제가 생김 when?
* 3개 중 하나의 argument만 주어졌을 때 1번째 인자가 3번쨰 인자로도 들어감

$ ./shift.sh node27 Host is node27 ; Username is ; Password is node27


* shift 2는 두개의 argumentㅡ를 shift하라는 건데 그걸 실패하게 됨. 그래서 명령어로 아무거도 실행이 안되고, 남은 string인 전부다를 다시 password라는 변수에 넣게 됨
