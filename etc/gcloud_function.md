1) gcloud sdk mac용 설치 

2) gcloud init 으로 로그인 및 project 생성

3) 결제 정보 확인 

4) Cloud Functions API 사용 설정 

5) gcloud 업데이트

    gcloud components update &&
    gcloud components install beta

6) nvm 설치 후 예시 node.js 돌려보기 

- 처음 돌릴 때에는 runtime 설정 필요

Choices:

- **`nodejs8`**: Node.js 8
- **`nodejs10`**: Node.js 10
- **`python37`**: Python 3.7
- **`go111`**: Go 1.11
- **`nodejs6`**: Node.js 6 (deprecated)

    gcloud beta functions deploy helloGET --runtime=nodejs10 --trigger-http

[https://cloud.google.com/functions/docs/quickstart-console?hl=ko](https://cloud.google.com/functions/docs/quickstart-console?hl=ko)
