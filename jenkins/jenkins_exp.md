http://blog.nuti.pe.kr/2018/01/27/jenkins-description/


## Continuous Integration
개발자들이 개발한 소스코드들을 정기적으로 통합하는 것

Continuous Delivery
코드 변경에 따라 지속적으로 배포하는 것

내가 하려는 것은 CD!!

## Jenkins instance에 Blue ocean plugin 설치하기
 관리자 비밀번호를 모름

## pipeline 공부해보기

pipeline DSL(Domain-specific-language)를 통해서 code를 작성하여 파이프라인을 설계할 수 있다.

pipeline에는 두가지 문법이 있다. declarative 와 scripted.

pipeline 만드는 법
https://jenkins.io/doc/book/pipeline/getting-started/#through-the-classic-ui

```
Jenkinsfile (Declarative Pipeline)
pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                echo 'Hello world!'
            }
        }
    }
}

```
agent 는 jenkins에 executor와 workspace를 할당하도록 지시하는 역할을 한다.
node 는 agent와 같은 역할을 한다

https://dzone.com/articles/jenkins-pipeline-plugin-tutorial
