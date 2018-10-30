google api 를 사용하기 위해서는 인증 필요


### 1. API Key 로 인증하는 방식
* 구글 console 창에서 public API key 생성
* read 는 가능하나,  write 권한은 다 불가능하다. (아니 왜 public link 에 쓰는 거까지 막아?)
* 매우 제한적이지만  key 생성해서 바로 쓰기 쉽다. 어쨋든 내가 필요한 기능은 아니다.
* https://stackoverflow.com/questions/48747530/access-google-spreadsheet-api-without-oauth-token

### 2. OAuth 2.0 access tokens  얻기
user 의  private 정보 사용 없이 구글 드라이브에 파일을 저장할 수 있는 권한을 이를 통해 받을 수 있다.

user 의 동의를 거쳐야 하며 위의 public key 사용과는 다르게 복잡하다.

redirection 을 두번 거쳐야 한다. 내 사이트 -> 구글 -> 내 사이트

남의 데이터가 아니고 내 데이터를 쓰고 싶을 뿐인데 왜 이런걸...

https://developers.google.com/identity/protocols/OAuth2WebServer

1.  permission 확인
2.  requested permition list 와 함께 구글로 user redirect
3. user 가 권한 줄지 결정함
4. user 의 결정 확인
5.  동의했다면,  retrieves token needed to make API requests 


### 3.  Service Account 사용해서 aceess token 얻기
Oauth 인증을 받을 수 있는 또다른 방법은 서비스의  account 를 생성해서 접근하는 것.

이 방법은 다른 유저의 데이터를 사용하기보다, 구글 서비스를 사용하는 자신의 서비스 데이터를 얻는 데에 유용하다.


 필요한 필드를 채운 후  JWT Token ( JWT? http://jwtbuilder.jamiekurtz.com/) 으로 변환하여 구글로 제출 후 access token 을 얻어야 한다.
 
 인증은 1시간마다 갱신해야 하는 듯하다. 결국 편한건 하나도 없다.. 

https://developers.google.com/identity/protocols/OAuth2ServiceAccount


### 4. Service Account 방식으로  python 에서  drive 접근하기

```python
 pip install --upgrade google-api-python-client
 ```
 
 google client 설치한다. (service account 들어가서 json 파일 다운로드 받는다.)
 
 ```python
 from google.oauth2 import service_account
SCOPES = ["https://www.googleapis.com/auth/sqlservice.admin"]
SERVICE_ACCOUNT_FILE=r"C:\Users\gpfla\Downloads\service.json"
credentials = service_account.Credentials.from_service_account_file(
    SERVICE_ACCOUNT_FILE, scopes=SCOPES)
 ```
 credential object 생성
