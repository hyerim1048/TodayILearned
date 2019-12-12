### npm build
```
    npm run-script build
```
### nginx-docker

 
```
    FROM nginx:1.15.2-alpine
    
    COPY ./build /var/www
    COPY nginx.conf /etc/nginx/nginx.conf
    EXPOSE 80
    ENTRYPOINT ["nginx","-g","daemon off;"]
```
### gitlab docker registry

- gitlab registry 는 공짜다
- gitlab 계정을 만들고, repository 를 만든 후 해당 레포지토리의 도커 공간에 이미지를 push 한다!

### azure container

- Container Instances 띄우기

    띄울 때 gitlab 레지스트리로 로그인을 한다 

![https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cbf946a4-7d44-46e5-b8da-d423c2579774/Untitled.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cbf946a4-7d44-46e5-b8da-d423c2579774/Untitled.png)

### bitly

- bitly 로 azure로 만들어진 링크를 짧게 만들어서 공유한다
