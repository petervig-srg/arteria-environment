FROM php:5.6-apache

RUN runtimeDeps=" \
        libssl-dev \
        ssmtp \
        unoconv \
        pngquant \
        libmemcached-dev \
        libmagickwand-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $runtimeDeps

RUN docker-php-ext-install intl mbstring soap

RUN pecl install memcached-2.2.0 redis-4.3.0 mongo-1.6.16 imagick \
    && docker-php-ext-enable memcached.so redis.so mongo imagick
