#!/usr/bin/env bash

PORT=8881

echo 'start rtail('${PORT}')'
PROCESS_ID=`lsof -n -i :${PORT} | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
if [ '${PROCESS_ID}' != '' ]; then
    kill -9 ${PROCESS_ID}
fi
rtail-server --web-host 0.0.0.0 --web-port ${PORT} --web-version php-composer 2>&1 &

if [ ! -e /var/www/html/webapp/storage/logs/laravel.log ]; then
    curl http://127.0.0.1/xxxxxxxxxx > /dev/null
fi
tail -F /var/www/html/webapp/storage/logs/laravel.log |rtail --name laravel_log --mute 2>&1 &

if [ ! -e /var/log/httpd/access_log ]; then
    curl http://127.0.0.1/xxxxxxxxxx > /dev/null
fi
tail -F /var/log/httpd/access_log |rtail --name httpd_access_log --mute 2>&1 &

if [ ! -e /var/log/httpd/error_log ]; then
    curl http://127.0.0.1/xxxxxxxxxx > /dev/null
fi
tail -F /var/log/httpd/error_log |rtail --name php_error_log --mute 2>&1 &