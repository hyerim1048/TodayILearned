# install for production
## 제약사항 
* master node core 최소 2개 이상, ram 2gb 이상 

## 환경 
* master node 1대, slave node 2대 

## 수동으로 설치하기

1) update 

    $ sudo su
    # sudo apt-get update

2) swap off

    # swapoff -a
    # nano /etc/fstab

3) install docker 

    sudo apt install docker.io
    sudo systemctl enable docker
    systemctl enable docker.service

4) update hostname

- kmaster1
- knode1
- knode2 설정함

    vi /etc/hostname
    
    # 아래 명령어로도 바꿀 수 있음 
    hostnamectl set-hostname master-node

5) /etc/hosts 에 추가

    vi /etc/hosts 
    
     knode1
     knode2
     kmaster

7) ssh key generation 

- 서버끼리 통신하기 위함
- 현재 password login 을 허용해놔서 일단 pass
    - 나중에 pub key access 형태로 바꾸자

    ssh-keygen -t rsa

8) install kube

[https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

    sudo apt-get update && sudo apt-get install -y apt-transport-https curl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
    deb https://apt.kubernetes.io/ kubernetes-xenial main
    EOF
    sudo apt-get update
    sudo apt-get install -y kubelet kubeadm kubectl
    sudo apt-mark hold kubelet kubeadm kubectl

9) start kubeadm on master node 

### 추가사항 ) cgroup driver 세팅

    vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
    
    Environment=”cgroup-driver=systemd/cgroup-driver=cgroupfs” 추가 

docker setting도 바꿔줘야 함 

[https://kubernetes.io/docs/setup/production-environment/container-runtimes/](https://kubernetes.io/docs/setup/production-environment/container-runtimes/)  

    cat > /etc/docker/daemon.json <<EOF
    {
      "exec-opts": ["native.cgroupdriver=systemd"],
      "log-driver": "json-file",
      "log-opts": {
        "max-size": "100m"
      },
      "storage-driver": "overlay2"
    }
    EOF
    
    mkdir -p /etc/systemd/system/docker.service.d
    
    # Restart docker.
    systemctl daemon-reload
    systemctl restart docker

### Initializing your control-plane node on your master node

control-plane node 는 etcd (cluster db) and API server(kubectl CLI)와 같은 control plane components 가 운영되는 machine이다. 

1. control plane kubeadm 를 여러 개의 고가용성 클러스터로 만들기 위해서는 —control-plane-endpoint를 지정해야 한다. endpoint는 DNS 이름이나 load-balancer 의 이름이 될 수 있다 
2. kubeadm 을 초기화하기 위해서는 pod network add-on을 하나 선택해야 한다. --pod-network-cidr
- —pod-network-cidr : Classless Inter-Domain Routing
    - the address of your overlay network suh as Flannel
    - the network mask also defines how many pods can run per node
- —apiserver-advertise-address : IP address advertised by Kubernetes as its API server . 보통 master 의 기본 gateway 주소가 설정된다.

    kubeadm init --apiserver-advertise-address=<ip-address-of-kmaster-vm> \
    					--pod-network-cidr=192.168.0.0/16
    
    kubeadm init --pod-network-cidr=10.244.0.0/16
    
  # References

[https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/](https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/)  

[https://www.nakivo.com/blog/install-kubernetes-ubuntu/](https://www.nakivo.com/blog/install-kubernetes-ubuntu/) 

[https://www.edureka.co/blog/install-kubernetes-on-ubuntu#KubernetesInstallationPreRequisites](https://www.edureka.co/blog/install-kubernetes-on-ubuntu#KubernetesInstallationPreRequisites) 

[https://www.techrepublic.com/article/how-to-quickly-install-kubernetes-on-ubuntu/](https://www.techrepublic.com/article/how-to-quickly-install-kubernetes-on-ubuntu/)
