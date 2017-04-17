#!/usr/bin/env bash

PROCESS_ID=`lsof -n -i :9999 | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
if [ '${PROCESS_ID}' != '' ]; then
    kill -9 ${PROCESS_ID}
fi
rtail-server --web-host 0.0.0.0 --web-port 8888 &

if [ ! -e /var/www/html/webapp/storage/logs/laravel.log ]; then
    echo 'created' > /var/www/html/webapp/storage/logs/laravel.log
fi
tail -F /var/www/html/webapp/storage/logs/laravel.log |rtail --name laravel_log &
if [ ! -e /var/log/httpd/access_log ]; then
    echo 'created' > /var/log/httpd/access_log
fi
tail -F /var/log/httpd/access_log |rtail --name httpd_access_log &
if [ ! -e /var/log/httpd/error_log ]; then
    echo 'created' > /var/log/httpd/error_log
fi
tail -F /var/log/httpd/error_log |rtail --name php_error_log &


