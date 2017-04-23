# Docker container for Java application (+ Tomcat 8)

## Preparation
### build docker
```bash
# build docker image
docker build . -t java-tomcat
```

### start docker container
#### If using executable jar file:
```bash
# run docker container
docker run -d -v {executable jar file placed directory}:/opt/ -p 8080:8080 -p 8882:8882 --name {container name} java-tomcat tail -F /dev/null
```

#### If using tomcat 8:
```bash
# run docker container
docker run -d -v {war file placed directory}:/opt/tomcat/webapps -p 8080:8080 -p 8882:8882 --name {container name} java-tomcat tail -F /dev/null
```

## Usage
### If using executable jar file:
```bash
# start executable jar @docker container
docker exec {container name} /root/bin/start_jar.sh
```

### If using tomcat:
```bash
# start tomcat @docker container
docker exec {container name} /root/bin/start_tomcat.sh
# restart tomcat @docker container
docker exec {container name} /root/bin/restart_tomcat.sh
# stop tomcat @docker container
docker exec {container name} /opt/tomcat/bin/shutdown.sh
```


