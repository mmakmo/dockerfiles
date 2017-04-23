#!/usr/bin/env bash

echo 'restart tomcat'

# error trap
set -euo pipefail
trap "[ERROR] exited with errors on restart_tomcat.sh@java-tomcat." ERR

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
/opt/tomcat/bin/shtdown.sh
/root/bin/start_tomcat.sh 2>&1 &