#!/bin/bash

# انسخ ملف env لو مش موجود
if [ ! -f .env ]; then
  cp .env.example .env
fi
# أوامر Laravel الأساسية
php artisan key:generate --force
php artisan config:clear
php artisan cache:clear
php artisan storage:link
php-fpm