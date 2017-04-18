FROM centos:latest

ENV HEAPSTATS_URL='http://icedtea.wildebeest.org/download/heapstats/heapstats-2.0.4/bin/agent/el7/x86_64/heapstats-2.0.4-0.el7.x86_64.rpm'
ENV TOMCAT8_VERSION='8.5.13'

# install required packages
RUN echo 'install required packages' && \
    yum install -y yum-fastestmirror epel-release && \
    yum update -y && \
    yum upgrade -y && \
    yum install -y lsof java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        net-snmp-libs net-snmp gcc-c++ make \
        
    yum clean all && \
    echo 'export JAVA_HOME=/usr/bin/java' >> $HOME/.bashrc && \
    source $HOME/.bashrc && \

    # install tomcat 8
    curl -o /tmp/tomcat-${TOMCAT8_VERSION}.tar.gz http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/tomcat/tomcat-8/v${TOMCAT8_VERSION}/bin/apache-tomcat-${TOMCAT8_VERSION}.tar.gz && \
    tar zxvf /tmp/tomcat-${TOMCAT8_VERSION}.tar.gz &&\
    mv ./apache-tomcat-${TOMCAT8_VERSION} /opt/ && \
    ln -s /opt/apache-tomcat-${TOMCAT8_VERSION} /opt/tomcat && \

    # install node.js and rtail
    curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - && \
    yum install -y nodejs && \
    npm install -g rtail && \

    # install heapstats
    curl -o /tmp/heapstats.rpm $HEAPSTATS_URL && \
    rpm -ivh tmp/heapstats.rpm && \

    # cleanup
    mkdir /root/bin && \
    rm -rf /tmp/*

COPY bin/start_tomcat.sh /root/bin/
COPY bin/restart_tomcat.sh /root/bin/
COPY bin/start_jar.sh /root/bin/
COPY bin/start_rtail.sh /root/bin/

# for tomcat
EXPOSE 80 443
EXPOSE 8080 8081 8082 8083 8084 8085
# for heapstats
EXPOSE 4711
# for rtail
EXPOSE 8882
CMD /sbin/init