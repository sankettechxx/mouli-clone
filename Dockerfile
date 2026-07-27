FROM php:8.2-apache
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update && apt-get install -y git unzip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . /var/www/html
RUN composer install --no-dev --optimize-autoloader
RUN php artisan key:generate
RUN chown -R www-data:www-data /var/www/html
