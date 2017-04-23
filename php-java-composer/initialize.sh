#!/usr/bin/env bash

CURRENT_DIR=$(cd $(dirname ./) && pwd)
SCRIPT_DIR=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || SCRIPT_DIR=`(cd "${SCRIPT_DIR}" && pwd)`

# error trap
set -euo pipefail
trap "[ERROR] exited with errors on initialize.sh." ERR

cd $SCRIPT_DIR

rm -rf logs/php-composer/*
rm -rf logs/java-tomcat/*

echo 'start logging' > logs/php-composer/PHP_Laravel.log
echo 'start logging' > logs/php-composer/PHP_Access.log
echo 'start logging' > logs/php-composer/PHP_Error.log
echo 'start logging' > logs/php-composer/PHP_npm_compile.log
echo 'start logging' > logs/java-tomcat/Java_build.log
echo 'start logging' > logs/java-tomcat/Java_app.log

echo 'build docker containers'
docker-compose up -d
cd $CURRENT_DIR

echo 'setup nginx-proxy container'
docker exec nginx-proxy /root/bin/startup.sh > /dev/null &

echo 'setup java-tomcat container'
docker exec java-tomcat /root/bin/initialize.sh > /dev/null &

echo 'setup php-composer container'
docker exec php-composer /root/bin/init_laravel.sh &

echo 'watching php-composer javascript changes'
docker exec php-composer /root/bin/watch_cli.sh > /dev/null &