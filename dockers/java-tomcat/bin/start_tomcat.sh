#!/usr/bin/env bash

echo 'start tomcat'
/opt/tomcat/bin/startup.sh
/root/bin/start_rtail.sh 2>&1 &
tail -F /opt/tomcat/logs/catalina.out |rtail --name tomcat_log --mute 2>&1 &