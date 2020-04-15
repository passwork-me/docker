#!/bin/bash

chown -R www-data:adm /server/log/nginx/
chown -R www-data:www-data /server/sites/

exec "$@"
