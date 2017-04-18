#!/usr/bin/env bash
PORT=8882

echo 'start rtail (port '${PORT}')'
PROCESS_ID=`lsof -n -i :${PORT} | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
if [ '${PROCESS_ID}' != '' ]; then
    kill -9 ${PROCESS_ID}
fi
rtail-server --web-host 0.0.0.0 --web-port ${PORT} --web-version java-tomcat 2>&1 &
tail -F /opt/tomcat/logs/catalina.out |rtail --name tomcat_log --mute 2>&1 &