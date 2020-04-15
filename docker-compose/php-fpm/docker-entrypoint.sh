#!/bin/bash

chown -R www-data:adm /server/log/php/
chown -R www-data:www-data /server/sites/

exec "$@"
