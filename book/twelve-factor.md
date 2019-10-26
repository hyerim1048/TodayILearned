[The Twelve-Factor App](https://12factor.net)

software as a service 

- use declarative formats for setup automation
- clean contract, maximum portability
- minimize divergence between development and production
- scale up

## 1. Codebase

- git, mercurial, subversion
- codebase is any single repo
- if there are multiple codebases : **its not an app! distributed system!**
- 1 codebase = one app and many deploys
    - a production, one or more staging

## 2. Dependencies

- explicitly declare and isolate dependencies
- most languages have a package system a: system-wide or into the directory
- **Never relies on implicit existence of system-wide packages**
- declare all dependencies, completely and exactly
    - dependency declaration manifest
    - dependency isolation tool
        - for example. python, In Python there are two separate tools for these steps – Pip is used for declaration and Virtualenv for isolation

### 3. config

config in the environment 

코드에 환경설정 하지마라 

### 4. Backing servives

- mysql, memcached, google api 등등 많은 서비스들이 붙어 있을 텐데
    - local과 third party를 구분하지 마라
- url, config는 설정값에 있을 것이고 deploy 단계별로 각각 그 설정을 switch 하며 test해볼 것이다
- distinct backing servce : resource
    - e.g. mysql is a resource 여러개의 sharding 된 db가 있더라도 똑같이 취급한다
- Resources can be attached to and detached from deploys at will
    - 하드웨어 이슈 때문에 디비가 문제 생겨도 app관리자는 백업에서 가져온 새로운 db로 바로 붙을 수 있어야 한다

### 5. Build, release, run

Strictly separate build and run stages 

- build : convert a code repo into an executable bundle known as a build
- release : combine build and config , ready for immediate execution
- run : launching some set of processes
- if fail, roll back to a previous release 예를 들어 심볼릭 링크로 관리할 수도 있음

[](https://www.notion.so/a34f9ddc4e474bc8ae14096a487bd073#3b3eab49ba094f61b54e0f2c80f3d2f4)

 

### 6. Processes

execute app as one or more stateless processes 

- Twelve-factor processes are stateless and share-nothing. Any data that needs to persist must be stored in a stateful backing service, typically a database
- Session state data is a good candidate for a datastore that offers time-expiration, such as Memcached or Redis.

### 7. Port binding

- 웹앱과 웹서버가 독립적이어야 하며, runtime에 webserver가 무엇인가 주입하는것에 의존하면 안된다
- port를 binding하고 port로 들어오는 요청을 기다린다
- 외부에서 host로 요청이 들어오면 port에 binding되어있는 웹 프로세스에 전달한다
- e.g. python tornado

### 8. Concurrency

shut down gracefully when they receive a SIGTERM
