FROM yiisoftware/yii2-php:7.3-apache

RUN a2enmod rewrite

WORKDIR /app

COPY . .

RUN apt-get update

RUN composer install --ignore-platform-reqs --no-interaction --prefer-dist --optimize-autoloader && \
    composer clear-cache

COPY .env.example .env

RUN mkdir -p runtime web/assets && \
    chmod -R 775 runtime web/assets && \
    chown -R www-data:www-data runtime web/assets

EXPOSE 80
