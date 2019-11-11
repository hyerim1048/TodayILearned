## kubernetes 경험기 - 2016

[https://techbeacon.com/devops/one-year-using-kubernetes-production-lessons-learned](https://techbeacon.com/devops/one-year-using-kubernetes-production-lessons-learned)  

- aws-based setup with custom scripts and tooling to automate deployments : **not easy for small teams to follow up!**
- no unit of deployment

### starting out with containers and orchestration tools

- had to take care of things like replica or failover
- Container clustering, networking, and deployment automation are actually very hard problems to solve.

### load-balancing with Kube

- documentation
- how to access the deployed apps from the internet?
    - GCE makes it automatically configured but not with it, you need **some configs for load balancing**
    - **expose a service directly** on a host machine get **port conflicts** when deploying multiple apps tgt

### a two-step load-balancer setup

- configure a load balancer like HAProxy or NGINX in front of the Kube cluster
    - running Kube inside a VPN on AWS, AWS Elastic Load Balancer to route external web traffic to an internal cluster
    - we needed a mechanism to dynamically **reconfigure the load balancer** (HAProxy, in our case) when new Kubernetes services are created
    - configuring load balancing
        - **store the load-balancer configurations in etcd**. We use a tool called c**onfd to watch configuration changes** in etcd

    [](https://www.notion.so/821d061d98d14eba81c402da88b8fb07#b628ce0975c1484d8428f2506e2dcd99)

    - now we can use **ingress : configure an external load balancer directly from Kubernetes**

    ### kubernetes: Maturing the right way

    - blue-green deployment
    - health check

    [](https://www.notion.so/821d061d98d14eba81c402da88b8fb07#45bc6aeed5b84ac3b99c8528bf6fa385)

    ## logging

    - Graylog
    - Kafka for messaging, collect and digest logs from containers

    ## monitoring

    - Kubernetes recovery works so well that we have had situations where our containers would crash **multiple times a day because of a memory leak, without anyone (including ourselves) noticing it.**
    - made a custom dashboard
        - to measure load, throughput, application errors, stats
            - influxDB, Heapster to gathering kube betrics, Grafana

    ### Data stores and Kubernetes

    - volume : can be backed by a variety of implemetations
        - like **files on machine, EBS, nfs → not a good answer for us**

    ### Replication issues

    - data stores run replicated and each node for a replica is backed by a different volume
        - writing to the same colume lead to data corruption
    - precise config to get the cluster up and running : auto discovery, config is not common

    ### not to use Kubes for running data stores in production

    - dynamics for kube cannot be useful for this
    - and SO COMPLEX to configure it
    - so.. set up these clusters on different hosts manually
    - you don’t have to run everything in Kubernetes once you have Kubernetes

    ## cost calculation

    - for smaller team, probably container service is better than tis
    - but for larger deployments, you can **save a lot!**
