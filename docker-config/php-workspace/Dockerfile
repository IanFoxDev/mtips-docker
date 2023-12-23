ARG DOCKER_PHP_VERSION

FROM php:${DOCKER_PHP_VERSION}-fpm

ARG TZ='UTC'

RUN apt-get update && apt-get install -y mc htop \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        iputils-ping
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli pdo_mysql


RUN docker-php-ext-install sockets \
    && docker-php-ext-configure sockets \
    && docker-php-ext-enable sockets

# composer v2
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-enable mysqli
RUN docker-php-ext-install bcmath
RUN apt-get install -y libicu-dev \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install intl
RUN docker-php-ext-install pcntl

RUN pecl install xdebug-3.3.0 && docker-php-ext-enable xdebug

RUN apt-get install -y libssh2-1-dev libssh2-1 wget unzip git ssh sshpass
RUN pecl install ssh2 && docker-php-ext-enable ssh2
