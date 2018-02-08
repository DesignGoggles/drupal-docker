FROM php:7.0-fpm

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev libpng-dev

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN docker-php-ext-install json