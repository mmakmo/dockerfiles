#!/usr/bin/env bash

echo 'initialize Laravel'

# error trap
set -euo pipefail
trap "[ERROR] exited with errors on init_larabel.sh@php-composer." ERR

export PATH="/root/.phpenv/bin:/root/.phpenv/:/root/.phpenv/shims/:$PATH"
cd /var/www/html/webapp/ && \
    composer install && \
    npm install

tail -F /var/www/html/webapp/storage/logs/laravel.log >> /var/log/laravel.log &

/root/bin/watch_cli.sh > /dev/null &

httpd -k restart