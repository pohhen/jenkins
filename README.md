# jenkins project

## Jenkins configuration for Docker

### How to set it up

```bash
# build Jenkins container using Dockerfile
docker build -t <container_name:tag> .
# run simple container - no docker
docker run -p <host_port:8080> <container_name:tag>
# create custom user and passwd with enviromental variable
docker run -p <host_port:8080> -e ENV_USER=<username> -e ENV_PASSWD=<pw> <container_name:tag>
```

### Running it

Open browser: [http://localhost:<host_port>](http://localhost)

### Notes

* admin user created with generated password if user does not exist
* you can create your own user with env variables
* you can add default plugins to plugins.txt that are installed during creation
* seed-job contais job config xmls
