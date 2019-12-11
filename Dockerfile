FROM php:7.3.12-fpm-alpine3.10
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql
RUN apk add shadow

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN usermod -u 1000 www-data

RUN chgrp -R www-data /var/www
RUN chmod  775 /var/www

RUN ln -s public html

EXPOSE 9000
ENTRYPOINT [ "php-fpm" ]