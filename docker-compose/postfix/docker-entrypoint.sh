#!/bin/bash

chown -R root:syslog /server/log/syslog/
service syslog-ng start

exec "$@"
