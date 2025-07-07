FROM php:7-apache

RUN apt-get update \
    && apt-get install -y libpq-dev \
    && docker-php-ext-install pgsql

RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf

ENV PORT=8080

EXPOSE 8080

WORKDIR /var/www/html

USER www-data

COPY . .

