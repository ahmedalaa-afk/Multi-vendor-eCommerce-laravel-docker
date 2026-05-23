#!/bin/bash

# انسخ ملف env لو مش موجود
if [ ! -f .env ]; then
  cp .env.example .env
fi
# أوامر Laravel الأساسية
php artisan key:generate --force
php artisan migrate --force
php artisan db:seed --class=Database\\Seeders\\UserSeeder --force
php artisan storage:link
