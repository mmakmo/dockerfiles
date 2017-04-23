#!/usr/bin/env bash

echo 'start tomcat'

# error trap
set -euo pipefail
trap "[ERROR] exited with errors on start_tomcat.sh@java-tomcat." ERR

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
/opt/tomcat/bin/startup.sh
/root/bin/start_rtail.sh 2>&1 &
tail -F /opt/tomcat/logs/catalina.out |rtail --name tomcat_log --mute 2>&1 &