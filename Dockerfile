FROM php:7-apache

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN install-php-extensions mysqli pdo_pgsql pdo_mysql

RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf

ENV PORT=8080

EXPOSE 8080

WORKDIR /var/www/html

USER www-data

COPY . .

