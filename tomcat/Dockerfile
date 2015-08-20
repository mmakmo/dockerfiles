FROM centos:6

# Install packages
RUN yum install -y wget tar

# Install JDK8b51
RUN wget -P /tmp/ --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm
#rpm -Uvh /tmp/jdk-8u51-linux-x64.rpm
RUN yum -y localinstall /tmp/jdk-8u51-linux-x64.rpm

# Install Tomcat 7
RUN wget -P /tmp/ http://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-7/v7.0.63/bin/apache-tomcat-7.0.63.tar.gz
RUN tar xvf /tmp/apache-tomcat-7.0.63.tar.gz -C /tmp/
RUN mv /tmp/apache-tomcat-7.0.63 /usr/local/
RUN ln -s /usr/local/apache-tomcat-7.0.63 /usr/local/tomcat
RUN export JAVA_HOME=/usr/java/default
RUN export CATALINA_HOME=/usr/local/tomcat


RUN wget -P /tmp/ http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-server-5.6.26-1.linux_glibc2.5.x86_64.rpm
RUN wget -P /tmp/ http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-compat-5.6.26-1.linux_glibc2.5.x86_64.rpm
RUN wget -P /tmp/ http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-client-5.6.26-1.linux_glibc2.5.x86_64.rpm

RUN yum -y localinstall /tmp/MySQL-shared-compat-5.6.26-1.linux_glibc2.5.x86_64.rpm
RUN yum -y localinstall /tmp/MySQL-server-5.6.26-1.linux_glibc2.5.x86_64.rpm
RUN yum -y localinstall /tmp/MySQL-client-5.6.26-1.linux_glibc2.5.x86_64.rpm

# Install rtail
RUN yum -y install epel-release
RUN yum -y install nodejs npm --enablerepo=epel
RUN yum -y install gcc gcc-c++ g++
RUN npm -y install -g rtail

# Start rtail
RUN 
RUN rtail-server --web-port 8090 --udp-port 9090 &

# Start Tomcat 7
EXPOSE 8090
EXPOSE 9090
EXPOSE 8000
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh jpda run
