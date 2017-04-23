#!/usr/bin/env sh
PORT=8888

rtail-server --web-host 0.0.0.0 --web-port ${PORT} 2>&1 &
nginx -g 'daemon off;' 2>&1 &

tail -F /root/logs/php-composer/PHP_Laravel.log | rtail --name 'PHP | Laravel' --no-date-parse --mute 2>&1 &
tail -F /root/logs/php-composer/PHP_Access.log | rtail --name 'PHP | Access' --no-date-parse --mute 2>&1 &
tail -F /root/logs/php-composer/PHP_Error.log | rtail --name 'PHP | Error' --no-date-parse --mute 2>&1 &
tail -F /root/logs/php-composer/PHP_npm_compile.log | rtail --name 'PHP | npm compile' --no-date-parse --mute 2>&1 &
tail -F /root/logs/java-tomcat/Java_build.log | rtail --name 'Java | Build JAR' --no-date-parse --mute 2>&1 &
tail -F /root/logs/java-tomcat/Java_app.log | rtail --name 'Java | App' --no-date-parse --mute 2>&1 &
