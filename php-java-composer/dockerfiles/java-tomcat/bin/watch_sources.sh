#!/usr/bin/env bash

export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
. /root/bin/functions.fnc

events=(-e CREATE -e MODIFY -e MOVED_TO)
while inotifywait ${events[@]} -mr /opt/src/src/ -o /dev/null; do
  echo ' ' >> /var/log/build.log
  echo '===============================================================================' \
    >> /var/log/build.log
  echo '[Start Build]' >> /var/log/build.log
  build_jar
  if [ -e /opt/src/build/libs/*.jar ]; then
    echo 'restarting jar...' >> /var/log/build.log
    restart_jar &
    echo '[End Build]' >> /var/log/build.log
  fi
done