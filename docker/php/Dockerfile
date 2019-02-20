FROM php:5.6-fpm

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev \
        libpng-dev \
        curl \
        wget \
        vim \
        git \
        unzip \
        mysql-client \
        ruby-dev \
        rubygems

RUN docker-php-ext-install pdo_mysql

# RUN docker-php-ext-install mysqli

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN docker-php-ext-install json

RUN gem install --no-rdoc --no-ri compass

RUN pecl install xdebug-2.5.3
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=192.168.1.43" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN echo "memory_limit = 1G" >> /usr/local/etc/php/php.ini
RUN echo "max_execution_time = 300" >> /usr/local/etc/php/php.ini
RUN echo "disable_functions = mail" >> /usr/local/etc/php/php.ini
RUN echo "date.timezone = america/new_york" >> /usr/local/etc/php/php.ini
RUN echo "zend_extension=opcache.so" >> /usr/local/etc/php/php.ini
RUN echo "opcache.enable=1" >> /usr/local/etc/php/php.ini
RUN echo "opcache.memory_consumption=128" >> /usr/local/etc/php/php.ini
RUN echo "opcache.max_accelerated_files=4000" >> /usr/local/etc/php/php.ini
RUN echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/php.ini
RUN echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require drush/drush:7.*

RUN composer global update

RUN echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc