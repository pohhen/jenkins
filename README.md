# jenkins project

## Jenkins configuration for Docker

### How to set it up
```sh
# build Jenkins container using Dockerfile
docker build -t <container_name:tag> .

# run container
docker run -p <host_port:8080> <container_name:tag>
```

### Running it
Open browser: [http://localhost:<host_port>](http://localhost)
Use the generated admin password for first login.
