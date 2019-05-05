## [Linux VM 시작하기](https://cloud.google.com/compute/docs/quickstart-linux)

- [공짜 인스턴스](https://cloud.google.com/free/docs/gcp-free-tier?hl=ko&_ga=2.39874978.-1057797204.1555116984#always-free-usage-limits)
    - f1-micro
- [컨테이너를 인스턴스 만들기 전에 설정할 수도 있음](https://cloud.google.com/compute/docs/containers/deploying-containers?hl=ko&_ga=2.3784368.-1057797204.1555116984)
    - 아에 쿠버네티스 엔진을 만들어도 됨 - 관리는 공짜

### [서비스 계정?](https://cloud.google.com/compute/docs/access/service-accounts?hl=ko)

- Compute Engine 인스턴스에서 실행되는 서비스나 앱에서 사용할 수 있는 특별 계정!
- 서비스 계정 사용자 인증정보를 통해 여러 API 액세스를 승인하고 가상 머신 인스턴스에 부여된 권한 내에서 작업을 수행할 수 있음.
- [인스턴스에 서비스 계정 설정](https://cloud.google.com/compute/docs/access/create-enable-service-accounts-for-instances?hl=ko&_ga=2.41169442.-1057797204.1555116984#changeserviceaccountandscopes)

### MAC에서 ssh 접근

- 공개키를 만들면 되는데 이메일 계정을 자기 구글 이메일 계정으로 만들면 됨
- ssh-keygen -t rsa -C "google-email"
- 공개키를 구글인스턴스 → 메타데이터 → ssh → 수정 에 추가함
