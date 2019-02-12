FROM php:7.3-fpm-alpine
MAINTAINER yok

RUN apk --update add libmcrypt-dev && rm -rf /var/cache/apk/* && \
    docker-php-ext-install mbstring && \
    docker-php-ext-configure mcrypt && \
    docker-php-ext-install mcrypt && \
    docker-php-ext-install pdo_mysql && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    composer global require hirak/prestissimo