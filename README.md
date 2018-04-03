# jenkins project

## Jenkins configuration for Docker

### How to set it up

```bash
# build Jenkins container using Dockerfile
docker build -t <container_name:tag> .
# run simple container - no docker
docker run -p <host_port:8080> <container_name:tag>
# to run containers in jenkins must docker.sock be mounted
docker run --privileged -v <host docker.sock>:/var/run/docker.sock -p <host_port:8080> <container_name:tag>
```

### Running it

Open browser: [http://localhost:<host_port>](http://localhost) - Use the generated admin password for first login.
