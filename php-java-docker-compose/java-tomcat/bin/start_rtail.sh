#!/usr/bin/env bash

/opt/tomcat/bin/startup.sh

PROCESS_ID=`lsof -n -i :8882 | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
if [ '${PROCESS_ID}' != '' ]; then
    kill -9 ${PROCESS_ID}
fi
rtail-server --web-host 0.0.0.0 --web-port 8882 &
tail -F /opt/tomcat/logs/catalina.out |rtail --name tomcat8_log &