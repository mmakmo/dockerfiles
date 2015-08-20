FROM centos:6

# Install packages
RUN yum install -y wget tar

# Install rtail
RUN yum -y install epel-release
RUN yum -y install nodejs npm --enablerepo=epel
RUN yum -y install gcc gcc-c++ g++
RUN npm -y install -g rtail

# Start rtail
RUN tail -f /var/log/messages | rtail &
EXPOSE 8090
EXPOSE 9090
CMD rtail-server --wp 8090 --up 9090 --wh 0.0.0.0 --uh 0.0.0.0
