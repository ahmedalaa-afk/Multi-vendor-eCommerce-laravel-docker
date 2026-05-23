# 1. Base Stage: نسطب فيها إضافات PHP عشان نستخدمها في باقي المراحل
FROM php:8.2-fpm AS base
WORKDIR /var/www

RUN apt-get update && apt-get install -y \
    curl unzip libpq-dev libonig-dev libssl-dev libxml2-dev libcurl4-openssl-dev libicu-dev libzip-dev \
    && docker-php-ext-install -j$(nproc) pdo_mysql pdo_pgsql intl zip bcmath soap \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 2. Builder Stage: مخصصة للـ Composer ونسخ ملفات المشروع
FROM base AS builder

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock ./
RUN composer install --no-dev --no-interaction --no-progress --prefer-dist --no-scripts

COPY . .

FROM base AS production
WORKDIR /var/www

COPY --from=builder /var/www /var/www

RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

EXPOSE 9000
CMD ["php-fpm"]