"젠킨스(Jenkins)는 거의 모든 언어의 조합과 소스코드 리포지토리(Repository)에 대한 지속적인 통합과 지속적인 전달 환경을 구축하기 위한 간단한 방법을 제공한다."

출처 : 
http://www.itworld.co.kr/news/107527#csidxdf5e37714b7f2d5af71b3ce8fa3cd1b 

젠킨스 대시보드에서 

새로운 item 클릭시 여러 프로젝트가 나타난다.

파이프라인 스크립트를 작성 후 젠킨스에 추가할 수 있다.
구성을 누르면 스크립트 작성한 걸 다시 볼 수 있다.

pipeline script 에 다음과 같이 입력후 build now 클릭하면 실행할 수 있다.

```
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Hello World"'
                sh '''
                    echo "Multiline shell steps works too"
                    ls -lah
                '''
            }
        }
    }
}
```
