#!/bin/bash

chown -R www-data:adm /server/log/nginx/
chown -R www-data:www-data /server/sites/
cp /server/sites/prod/app/config/config.example.ini /server/sites/prod/app/config/config.ini
sed -i 's/localhost:/db:/g' '/server/sites/prod/app/config/config.ini'

exec "$@"
