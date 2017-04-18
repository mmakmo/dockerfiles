#!/usr/bin/env bash
# $1 docker image tag name
# $2 container name
# $3 target project directory (full path)

DOCKER_IMAGE_NAME=$1
CONTAINER_NAME=$2
PROJECT_DIR=$3

if [ ! -e ${PROJECT_DIR} ]; then
    echo 'Not exist project directory: '${PROJECT_DIR}
    exit 9
fi

docker build . -t ${DOCKER_IMAGE_NAME}
# run docker container
docker run -d -v ${PROJECT_DIR}:/var/www/html/webapp -p 80:80 -p 9002:9000 -p 8881:8881 --name ${CONTAINER_NAME} ${DOCKER_IMAGE_NAME}  tail -f /dev/null
#  @docker container
docker exec ${CONTAINER_NAME} /root/bin/init_laravel.sh
#  @docker container
docker exec ${CONTAINER_NAME} /root/bin/start_rtail.sh