function restart_jar {
    DEBUG_PORT=8000
    PROCESS_ID=`lsof -n -i :${DEBUG_PORT} | sed -n '2,2p' | awk '{print $2}' | cut -d " " -f 2`
    if [ '${PROCESS_ID}' != '' ]; then
        kill -9 ${PROCESS_ID} 2> /dev/null
    fi
    java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=$1,suspend=n \
        -jar /opt/src/build/libs/*.jar >> /var/log/javaapp.log > /dev/null &
}

function build_jar {
    rm -rf /opt/src/build/libs/*
    cd /opt/src && /opt/src/gradlew clean build generateJavadocs 2>> /var/log/build.log
}