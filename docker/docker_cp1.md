## docker

* dockered and CLI 
* 애플리케이션 배포에 특화되어 있으며 개발 및 운영을 컨테이너 중심으로 할 수 있음.
* 컨테이너 정보를 Dockerfile 코드로 관리할 수 있음 


## Cp.2 docker container 배포

* docker image : 컨테이너를 생성하는 템플릿 역할을 함 (컨테이너를 구성하는 파일시스템과 application 설정)
* docker container : 도커 이미지를 기반으로 실행되는 상태 

### docker image
* FROM : base image from docker hub registry 
  * to run go codes, it needs an runtime - image with go language
  * golang:1.9 (1.9 is a tag)
* RUN : commands that will run in a docker 
* COPY : copy file or directories into a docker container 
* CMD : a process to run an application in a container 
* ENV : environment variable in docker 
* EXPOSE : host 와 연결할 포트 번호 --expose와 같음 
* WORKDIR : RUN, CMD, ENTRYPOINT 명령이 실행될 디렉토리를 설
  * http://pyrasis.com/book/DockerForTheReallyImpatient/Chapter07/13
```
docker image build -t image_name[:tag_name] path_of_Dockerfile

```

### docker compose 
* 어플리케이션 간 의존관계 정의하기 
* docker compose : yaml format으로 기술된 설정 파일 
  * version: 해석하는데 필요한 문법 버전 
  * services 아래 container 이름 , 도커이미지, 포트포워딩 설정 지정 
  * https://docs.docker.com/compose/compose-file/compose-file-v2/
* docker-compose up : 여러 컨테이너를 한번에 시작 
 
  
 
