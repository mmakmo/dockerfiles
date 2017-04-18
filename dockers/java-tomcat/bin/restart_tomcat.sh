#!/usr/bin/env bash

echo 'restart tomcat'
/opt/tomcat/bin/shtdown.sh
/root/bin/start_tomcat.sh 2>&1 &