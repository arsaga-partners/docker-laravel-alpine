FROM php:7.3-fpm-alpine
MAINTAINER yok

RUN apk --update add libmcrypt-dev autoconf gcc libc-dev make pcre-dev zip zlib-dev git nodejs npm && rm -rf /var/cache/apk/* && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install pcntl && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    pecl install apcu && \
    echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apcu.ini && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    composer global require hirak/prestissimo
