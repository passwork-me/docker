#!/bin/bash

chown -R syslog:adm /server/log/syslog
chmod -R 775 /server/log/syslog
rsyslogd

exec "$@"
