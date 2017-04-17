FROM centos:latest

ENV HEAPSTATS_URL='http://icedtea.wildebeest.org/download/heapstats/heapstats-2.0.4/bin/agent/el7/x86_64/heapstats-2.0.4-0.el7.x86_64.rpm'

# install required packages
RUN echo 'install required packages' && \
    yum install -y epel-release && \
    yum update -y && \
    yum upgrade -y && \
    yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel \
        net-snmp-libs net-snmp gcc-c++ make && \
    yum clean all && \
    echo 'export JAVA_HOME=/usr/bin/java' >> $HOME/.bashrc && \
    source $HOME/.bashrc && \

    # install node.js and rtail
    curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - && \
    yum install -y nodejs && \
    npm install -g rtail && \

    # install heapstats
    curl -o /tmp/heapstats.rpm $HEAPSTATS_URL && \
    rpm -ivh tmp/heapstats.rpm && \

    # cleanup
    rm -rf /tmp/*

EXPOSE 80
EXPOSE 443
EXPOSE 4711
CMD /sbin/init