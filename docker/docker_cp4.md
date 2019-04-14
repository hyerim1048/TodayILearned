## cp3. 컨테이너 실전 구축 및 배포 
### docker swarm 사용해보기 
* docker-compose :여러 컨테이너로 구성된 도커 application을 관리 (주로 단일호스트)
* docker swarm : 클러스터 구축 및 관리 (주로 멀티호스트)
* docker service : 스웜에서 클러스터 안의 서비스를 관리 (컨테이너 하나이상)
* docker stack : 여러개의 서비스를 합친 전체 application 관리 

* dind : docker in docker, 로컬 개발 환경을 구축할 때 하나의 도커에서 여러개의 도커를 생성해서 사용해본다.
  * registry : dind 환경에서는 외부 도커 데몬에서 빌드된 이미지를 파일시스템을 통해 사용할 수 없으므로 그 역할을 registry 가 한다.

## cp4. 스웜을 이용한 실전 애플리케이션 개발

* SPOF : 단일 장애점 

## cp5. kubernetes

* node : 컨테이너가 배치되는 서버
* namespace : 쿠버네티스 클러스터 안의 가상 클러스터 
* pod : 컨테이너 집합 중 가장 작은 단위, 컨테이너의 실행방법 정의
* replica set :  같은 스펙을 갖는 pods을 여러개 생성하고 관리하는 역할 
* deployment : replicaset 의 리비전 관리 
* service : ㅍpods 집합에 접근하기 위한 경로 정의
* 인그레스 : 서비스를 쿠버네티스 클러스터 외부로 노출 
* configmap : 설정 정보를 정의하고 파드에 전달 
* 


