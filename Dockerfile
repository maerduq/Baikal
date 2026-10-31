FROM php:8.4-apache

# Install MySQL client, server, and other dependencies
RUN apt-get update \
	&& apt-get install -y \
        # libxml2 libxml2-dev\
        libzip-dev \
        # git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    # zip is used by Composer
    zip \
    pdo_mysql

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY composer.json composer.lock ./

RUN composer install --no-dev --no-autoloader --no-interaction

COPY . .

RUN composer dump-autoload --no-dev

RUN chmod -R 777 ./Specific \
    && chmod -R 777 ./config

# Set www root
ENV APACHE_DOCUMENT_ROOT=/app/html

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
