### docker engine

- core of docker system
    - app installed on the host machine
        - server - client  architecture
        - server 역할의 dockerd (docker daemon process)
            - **listens for Docker API requests and manages Docker objects** such as images, containers, networks, and volumes.
        - interface (rest api) : programs can use to talk to the daemon and instruct it what to do
        - CLI client (docker command)
            - When you **run the docker commands, the client sends these commands to dockerd**, which carries them out.
