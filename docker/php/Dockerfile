# FROM php:5.6-fpm
FROM php:7.0-fpm

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev \
        libpng-dev \
				curl \
				wget \
				vim \
				git \
				unzip \
				mysql-client

RUN docker-php-ext-install pdo_mysql

# RUN docker-php-ext-install mysqli

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN docker-php-ext-install json

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.profiler_enable_trigger=on" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN echo "disable_functions = mail" >> /usr/local/etc/php/php.ini
RUN echo "date.timezone = america/new_york" >> /usr/local/etc/php/php.ini
RUN echo "zend_extension=opcache.so" >> /usr/local/etc/php/php.ini
RUN echo "opcache.enable=1" >> /usr/local/etc/php/php.ini
RUN echo "opcache.memory_consumption=128" >> /usr/local/etc/php/php.ini
RUN echo "opcache.max_accelerated_files=4000" >> /usr/local/etc/php/php.ini
RUN echo "opcache.revalidate_freq=0" >> /usr/local/etc/php/php.ini
RUN echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/php.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# RUN composer global require drush/drush:7.*
RUN composer global require drush/drush:dev-master

RUN composer global update

RUN echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc