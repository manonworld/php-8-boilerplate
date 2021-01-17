FROM php:8-cli-buster

RUN apt-get update && apt-get install -y wget git zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN wget https://get.symfony.com/cli/installer -O - | bash

RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www/html

RUN symfony server:ca:install

RUN symfony proxy:start

RUN symfony proxy:domain:attach manon
