#!/bin/env bash
tail -F /var/www/html/webapp/storage/logs/laravel.log |rtail --name laravel_log &
tail -F /var/log/httpd/access_log |rtail --name httpd_access_log &
tail -F /var/log/httpd/error_log |rtail --name php_error_log &

PROCESS_ID=`lsof -n -i :9999 | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
if [ '${PROCESS_ID}' != '' ]; then
    kill -9 ${PROCESS_ID}
fi
rtail-server --web-host 0.0.0.0 &
