# MAVEN

- java에서 프로젝트 빌드, 관리에 사용되는 도구
    - Build Tool + Project Management
- apache  project

### Plugin

---

- maven = plugin execution framework
- a set of goals

### Mojo (마력)

---

- Goals (명령 or 작업)
- <plugin>:<goal>
    - mvn archetype:generate
- 여러 goal을 묶어 lifecycle phases로 만들고 실행한다

### lifecycle

---

- phase에 연계된 goal을 실행하는 것
- 논리적인 작업의 집합
- 일반적인 라이프사이클
    - clean : 빌드시 생성된 산출물 삭제
    - default : 일반적인 빌드 프로세스
    - site : 프로젝트 문서와 사이트 작성 수행

### Phase

---

- 논리적 개념이며 실질적 작업을 수행하는 건 plugin goal
- default lifecycle : jar를 생성하는 작업을 수행

### dependency

---

- library download 자동화
    - 선언하면 자동으로 download
- declaration
- lib directory 를 생성하거나 이클립스에서 라이브러리, 클래스패스 환경 설정을 할 필요가 없음

### POM

---

- Project Object Model
- 프로젝트 당 하나의 pom.xml
- maven은 pom.xml을 읽어 가공
    - Group ID
    - Artifact ID
    - Version

[https://www.slideshare.net/sunnykwak90/ss-43767933](https://www.slideshare.net/sunnykwak90/ss-43767933)  

[http://maven.apache.org/guides/getting-started/index.html#What_is_Maven](http://maven.apache.org/guides/getting-started/index.html#What_is_Maven)  

[https://sjh836.tistory.com/131](https://sjh836.tistory.com/131)
