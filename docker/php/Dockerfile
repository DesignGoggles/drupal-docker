FROM php:7.2-fpm

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev \
        libpng-dev \
        curl \
        wget \
        vim \
        git \
        unzip \
        default-mysql-client \
        ruby-dev \
        rubygems

RUN docker-php-ext-install pdo_mysql

# RUN docker-php-ext-install mysqli

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN docker-php-ext-install json

RUN gem install --no-rdoc --no-ri compass

COPY php.ini /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require drush/drush

RUN composer global update

RUN echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc
