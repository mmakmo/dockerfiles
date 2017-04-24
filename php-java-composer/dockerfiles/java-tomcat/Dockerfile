FROM centos:latest

ENV HEAPSTATS_URL='http://icedtea.wildebeest.org/download/heapstats/heapstats-2.0.4/bin/agent/el7/x86_64/heapstats-2.0.4-0.el7.x86_64.rpm' \
    TOMCAT8_VERSION='8.5.14' \
    TOMCAT8_URL='http://www-us.apache.org/dist/tomcat/tomcat-8'
#    DEBUG_PORT=8000

# install required packages
RUN echo 'install required packages' && \
    yum install -y yum-fastestmirror epel-release && \
    yum update -y && \
    yum upgrade -y && \
    yum install --enablerepo=epel -y inotify-tools && \
    yum install -y lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel php && \
        
    yum clean all && \
    echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")' >> /etc/bashrc && \

    # install tomcat 8
    curl -o /tmp/tomcat-${TOMCAT8_VERSION}.tar.gz ${TOMCAT8_URL}/v${TOMCAT8_VERSION}/bin/apache-tomcat-${TOMCAT8_VERSION}.tar.gz && \
    tar zxvf /tmp/tomcat-${TOMCAT8_VERSION}.tar.gz &&\
    mv ./apache-tomcat-${TOMCAT8_VERSION} /opt/ && \
    ln -s /opt/apache-tomcat-${TOMCAT8_VERSION} /opt/tomcat && \

    # install heapstats
    #curl -o /tmp/heapstats.rpm $HEAPSTATS_URL && \
    #rpm -ivh tmp/heapstats.rpm && \

    # cleanup
    mkdir /root/bin && \
    mkdir /opt/app && \
    mkdir /opt/src && \
    rm -rf /tmp/*

COPY bin/* /root/bin/
COPY contents/* /var/www/html/

# for tomcat [80, 443, 8080]
# for remote debug [8000]
# for heapstats [4711]
# for rtail [8882]
EXPOSE 80 443 8080 8000 4711 8882

CMD /sbin/init