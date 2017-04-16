FROM centos:latest

ENV PHP_VERSION=7.1.4
ENV PROJECT=webapp

# install required packages
RUN yum install -y epel-release && \
    yum update -y && \
    yum upgrade -y && \
    yum install -y libxml2-devel openssl-devel \
        curl-devel libjpeg-devel libpng-devel \
        libXpm-devel freetype-devel libmcrypt-devel \
        readline-devel libtidy-devel libxslt-devel \
        gcc cmake make git bzip2 bzip2-devel \
        libmcrypt libmcrypt-devel libtidy-devel\
        libicu-devel gcc-c++ autoconf automake && \
    yum install --enablerepo=epel -y re2c httpd httpd-devel && \
    curl --silent --location https://rpm.nodesource.com/setup_7.x | bash - && \
    yum install -y nodejs && \
    yum clean all

# install PHP and Composer
    # install phpenv
RUN curl -L https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | sh && \

    # install php-build
    git clone https://github.com/php-build/php-build $HOME/.phpenv/plugins/php-build && \
    echo 'export PATH="/root/.phpenv/bin:$PATH"' >> /root/.bashrc && \
    echo 'eval "$(phpenv init -)"' >> /root/.bashrc && \
    source /root/.bashrc && \
    cp /root/.phpenv/plugins/php-build/share/php-build/default_configure_options /root/.phpenv/plugins/php-build/share/php-build/default_configure_options.org && \
    sed -i -e '/^--with-mysql/d' /root/.phpenv/plugins/php-build/share/php-build/default_configure_options && \
    ## for apache httpd
    echo '--with-apxs2=/usr/bin/apxs' >> /root/.phpenv/plugins/php-build/share/php-build/default_configure_options && \
    echo '--enable-intl' >> /root/.phpenv/plugins/php-build/share/php-build/default_configure_options && \

    # install php
    /root/.phpenv/bin/phpenv install $PHP_VERSION && \
    /root/.phpenv/bin/phpenv global $PHP_VERSION && \
    sed -e 's/;date.timezone =/date.timezone = "Asia\/Tokyo"/g' /root/.phpenv/versions/$PHP_VERSION/etc/php.ini && \

    # install composer
    curl -sS https://getcomposer.org/installer | php && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer && \

    # setup apache configs
    sed -i 's/#ServerName www.example.com:80/ServerName 127.0.0.1/' /etc/httpd/conf/httpd.conf && \
    sed -i '/<Directory \"\/var\/www\/html\">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf && \
    mkdir /var/www/html/$PROJECT && \
    mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.org && \

    # cleanup
    rm -rf /tmp/*

COPY $PROJECT.conf /etc/httpd/conf.d/

WORKDIR /var/www/html/webapp/
EXPOSE 80
EXPOSE 9000
CMD /sbin/init