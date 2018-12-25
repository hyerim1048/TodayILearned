### linux에서 공개키 인증하기

* scp 로 한 서버(A)에서 다른 서버(B)로 데이터를 보낼 때 서로 key인증이 되지 않아서 실패하는 경우가 있다
* 그럴 경우에 B서버에서 공개키를 생성한 후에
* A서버에서 해당 공개키를 /home/user/.ssh/authoorized_keys에 추가해주면 된다.



출처 : http://slog2.egloos.com/v/3491718
