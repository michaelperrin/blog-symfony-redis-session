FROM composer:1.10 as composer
FROM php:7.4-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER=1

# Add Composer to PHP container
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

RUN apk add --no-cache wget bash
RUN wget https://get.symfony.com/cli/installer -O - | bash
ENV PATH="/root/.symfony/bin:${PATH}"

RUN apk add --no-cache \
    ca-certificates \
    icu-libs \
    git \
    unzip \
    libzip && \
    apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    icu-dev

RUN apk add --no-cache libzip-dev
RUN docker-php-ext-install \
    intl \
    zip

# Install PHP Redis extension
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

ADD ./app /var/www/html
WORKDIR /var/www/html

RUN composer install
