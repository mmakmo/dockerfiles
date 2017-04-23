#!/usr/bin/env bash
DEBUG_PORT=8000

# error trap
set -euo pipefail
trap "[ERROR] exited with errors on start_jar.sh@java-tomcat." ERR

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
. /root/bin/functions.fnc

restart_jar ${DEBUG_PORT} > /dev/null &