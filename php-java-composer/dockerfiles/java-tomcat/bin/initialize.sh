#!/usr/bin/env bash

# error trap
set -euo pipefail
trap "[ERROR] exited with errors initialize.sh@java-tomcat." ERR

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
/root/bin/start_jar.sh > /dev/null &
/root/bin/watch_sources.sh &