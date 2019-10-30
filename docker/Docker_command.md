Docker Commands 

```
Docker version 
Docker [management commend] [sub command] 

Docker container run
My client command to engine (docker -server)
Docker info 
```


* Image : binaries and source codes all make up
* container : Instance of images 
* From registry (docker hub) : you can get default image 

* Docker container run 
	* --publish 80:80  
	open port 80 on the host and route that to the container IP, port 80
	* --detach : running it background 

* Docker container ls 
* Docker container stop : container ID 
Ls -a : 
Docker container run --publish 80:80 --detach web_host_nginx : 이름 써주고 백그라운드로 돌기 

* Docker container logs webhost 
* Docker container top webhost : process running in a container 
Spawn worker 

Docker container rm
* Running container 는 기본적으로 지울수 없음 
* Rm -f 는 가능 

## What happens in docker container run command 
* Look for image locally in image cache 
* Looks remote image repo 
* Download latest 
* New container based on that image 
* Gives it a virtual IP on private network inside docker engine 
* Open 80 and forward to port 80 
* Cmd dockerfile 
* containers are processes 
Docker top process in container 
Ps aux 

Docs.docker.com 
Nginx, mysql, httpd(apacje)
--detach, --name 
 
