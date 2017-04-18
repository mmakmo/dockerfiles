#!/usr/bin/env bash

CURRENT_DIR=$(cd $(dirname ./) && pwd)
SCRIPT_DIR=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || SCRIPT_DIR=`(cd "${SCRIPT_DIR}" && pwd)`

cd $SCRIPT_DIR

echo 'build docker containers'
docker-compose up -d

echo 'setup java-tomcat container'
docker exec java-tomcat /root/bin/start_tomcat.sh > /dev/null &
docker exec java-tomcat /root/bin/start_rtail.sh > /dev/null &

echo 'setup php-composer container'
docker exec php-composer /root/bin/init_laravel.sh &
docker exec php-composer /root/bin/start_rtail.sh > /dev/null &

echo 'watching php-composer javascript changes'
docker exec php-composer npm run watch

cd $CURRENT_DIR