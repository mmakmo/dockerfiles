FROM alpine:latest

RUN apk add --no-cache nginx nodejs && \
    npm install -g rtail && \
    mkdir -p /run/nginx && \
    mkdir -p /root/bin && \
    mkdir -p /root/logs && \
    mkdir -p /var/www/localhost/src && \
    mkdir -p /var/www/localhost/contents && \
    mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.org && \
    rm -rf /var/cache/apk/* &&\
    rm -rf /tmp/*

COPY config/proxy.conf /etc/nginx/conf.d/
COPY contents/* /var/www/localhost/contents/
COPY bin/startup.sh /root/bin/

EXPOSE 80 443