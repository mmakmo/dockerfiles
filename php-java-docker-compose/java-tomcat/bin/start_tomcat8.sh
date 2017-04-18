#!/usr/bin/env bash

/opt/tomcat/bin/startup.sh

/root/bin/start_rtail.sh &

tail -F /opt/tomcat/logs/catalina.out |rtail --name tomcat8_log &