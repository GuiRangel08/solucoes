FROM php:8.2.3-apache

RUN apt-get update && \
    apt-get install -y curl git unzip libzip-dev libonig-dev && \
    docker-php-ext-install pdo pdo_mysql zip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-enable mysqli

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html/ && \
    chmod -R 755 /var/www/html/

RUN apt update && apt install git

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
