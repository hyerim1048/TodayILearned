google api 를 사용하기 위해서 필요


API Key 로 인증하는 방식
* 구글 console 창에서 public API key 생성
* read 는 가능하나,  write 권한은 다 불가능한 것 같다..
* https://stackoverflow.com/questions/48747530/access-google-spreadsheet-api-without-oauth-token

OAuth 2.0 access tokens  얻기
user 의  private 정보 사용 없이 구글 드라이브에 파일을 저장할 수 있는 권한을 이를 통해 받을 수 있다.
위의 public key 사용과는 다르게 복잡하다.
https://developers.google.com/identity/protocols/OAuth2WebServer

1.  permission 확인
2.  requested permition list 와 함께 구글로 user redirect
3. user 가 권한 줄지 결정함
4. user 의 결정 확인
5.  동의했다면,  retrieves token needed to make API requests 


