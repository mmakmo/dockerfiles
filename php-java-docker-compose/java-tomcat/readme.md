# Docker container for Java application (+ Tomcat 8)

## Preparation
### build docker
```bash
# build docker image
docker build . -t java-tomcat8
```

### start docker container
#### If using executable jar file:
```bash
# run docker container
docker run -d -v {executable jar file placed directory}:/opt/ -p 8080:8080 -p 8882:8882 --name {container name} java-tomcat8  tail -f /dev/null
```

#### If using tomcat 8:
```bash
# run docker container
docker run -d -v {war file placed directory}:/opt/tomcat/webapps -p 8080:8080 -p 8882:8882 --name {container name} java-tomcat8  tail -f /dev/null
```

## Usage
### If using executable jar file:
```bash
# start executable jar @docker container
docker exec {container name} /root/bin/start_jar.sh &
```

### If using tomcat 8:
```bash
# start tomcat 8 @docker container
docker exec {container name} /root/bin/start_rtail.sh &
# stop tomcat 8 @docker container
docker exec {container name} /opt/tomcat/bin/shutdown.sh
```


