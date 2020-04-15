#!/bin/bash

chown -R mongodb:mongodb /server/data
chown -R mongodb:mongodb /server/log
chown -R mongodb:mongodb /server/conf

exec "$@"
