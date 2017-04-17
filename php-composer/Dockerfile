FROM centos:latest

ENV PHP_VERSION=7.1.4
ENV PROJECT=webapp

# install required packages
RUN yum install -y epel-release && \
    yum update -y && \
    yum upgrade -y && \
    yum install -y lsof libxml2-devel openssl-devel \
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
RUN echo 'Install PHP and Composer' && \
    # install phpenv
    curl -L https://raw.githubusercontent.com/CHH/phpenv/master/bin/phpenv-install.sh | sh && \

    # install php-build
    git clone https://github.com/php-build/php-build $HOME/.phpenv/plugins/php-build && \
    echo 'export PATH="$HOME/.phpenv/bin:$PATH"' >> $HOME/.bashrc && \
    echo 'eval "$(phpenv init -)"' >> $HOME/.bashrc && \
    source $HOME/.bashrc && \
    cp $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options.org && \
    sed -i -e '/^--with-mysql/d' $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options && \
    ## for apache httpd
    echo '--with-apxs2=/usr/bin/apxs' >> $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options && \
    echo '--enable-intl' >> $HOME/.phpenv/plugins/php-build/share/php-build/default_configure_options && \

    # install php
    $HOME/.phpenv/bin/phpenv install $PHP_VERSION && \
    $HOME/.phpenv/bin/phpenv global $PHP_VERSION && \
    sed -e 's/;date.timezone =/date.timezone = "Asia\/Tokyo"/g' $HOME/.phpenv/versions/$PHP_VERSION/etc/php.ini && \
    echo 'xdebug.remote_enable=1' >> $HOME/.phpenv/versions/7.1.4/etc/conf.d/xdebug.ini && \
    echo 'xdebug.remote_autostart=1' >> $HOME/.phpenv/versions/7.1.4/etc/conf.d/xdebug.ini && \

    # install composer
    curl -sS https://getcomposer.org/installer | php && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer && \

    # setup apache configs
    sed -i 's/#ServerName www.example.com:80/ServerName 127.0.0.1/' /etc/httpd/conf/httpd.conf && \
    sed -i '/<Directory \"\/var\/www\/html\">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf && \
    mkdir /var/www/html/$PROJECT && \
    mkdir /root/bin && \
    mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.org && \

    # install rtail
    npm install -g rtail && \

    # cleanup
    rm -rf /tmp/*

COPY config/$PROJECT.conf /etc/httpd/conf.d/
COPY bin/init_laravel.sh /root/bin/
COPY bin/start_rtail.sh /root/bin/


WORKDIR /var/www/html/webapp/
EXPOSE 80
EXPOSE 443
EXPOSE 9000
EXPOSE 8888
CMD /sbin/init