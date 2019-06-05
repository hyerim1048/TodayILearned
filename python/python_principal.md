### Python

- no saying about if its an compiled or interpreted programming language
    - its a property of the implemetation
- py : source code → pyc : byte code
    - byte code can be interpreted(CPython) or JIT compiled (Pypy)

[http://net-informations.com/python/iq/interpreted.htm](http://net-informations.com/python/iq/interpreted.htm)

- cpython : general implemetation

Python Dynamically Typed rather than Statically Typed 

- integer가 실행 시에 python object로 인식됨

 

### Python is interpreted rather than compiled

- source code를 기계어로 번역하여 실행하는 것이 아니라 실시간으로 source code를 직접 실행한다

Python List 객체는 length 와 item의 주소를 가지고 있어서 한번더 주소가 가리키는 변수에 접근하게 됨 

[https://m.blog.naver.com/PostView.nhn?blogId=passion053&logNo=221112010085&proxyReferer=https%3A%2F%2Fwww.google.com%2F](https://m.blog.naver.com/PostView.nhn?blogId=passion053&logNo=221112010085&proxyReferer=https%3A%2F%2Fwww.google.com%2F)

### Python Virtual address space

- save all objects in private heap
- data, stack x
- heap → register → ALU 연산 수행
- stack → stack-register-heap 순으로 재전달
- 참고로 java도 heap영역만 사용하며 C는 영역 모두 사용
- 그러므로 파이썬에서 메모리를 관리한다는 것은
- 데이터 구조체들을 담아두는 heap영역을 다루는 것임.
- 파이썬 메모리 관리자는 내부적으로 heap 영역 관리를 보장함.

- python에서 문자열은 불변값이다 .
- + 대신에 .format % 를 사용해라
- 또는 .join()

### Garbage Collection

- 메모리 관리 기법
- 프로그램이 동적으로 할당했던 메모리 영역에서 필요없게 된 영역을 해제하는 기능
-
