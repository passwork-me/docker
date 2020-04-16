#!/bin/bash

chown -Rv syslog:adm /server/log/syslog
chmod -Rv 775 /server/log/syslog
rsyslogd

exec "$@"
