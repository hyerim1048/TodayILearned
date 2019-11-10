## Persistent data 
docker 를 사용해서 stateful, 즉 상태를 갖는 앱을 운영하려면 기존에 사용하던 파일과 directory를 그대로 이어 받아 사용할 수있어야 하며, docker에서는 data volume 을 사용한다 


## Bind Mounts 
* https://docs.docker.com/storage/bind-mounts/ 
* a file or dir on host is mounted into a container like shared folder!
* docker container 안의 directory를 persistent data로 남기기 위한 방법이며 호스트와 컨테이너 사이의 directory 공유 및 재사용 기능을 제공한다 
## Data Volume 
* https://docs.docker.com/storage/volumes/
* a new dir is created within Docker's storage dir on the host machine 
* docker manages that directory's contents 
* The file or directory does not need to exist on the Docker host already. It is created on demand if it does not yet exist.
Volumes are easier to back up or migrate than bind mounts.
You can manage volumes using Docker CLI commands or the Docker API.
Volumes work on both Linux and Windows containers.
Volumes can be more safely shared among multiple containers.
Volume drivers let you store volumes on remote hosts or cloud providers, to encrypt the contents of volumes, or to add other functionality.
New volumes can have their content pre-populated by a container.