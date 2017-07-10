#!/bin sh

[ -f /var/run/rsyslogd.pid ] && rm -f /var/run/rsyslogd.pid

/usr/sbin/rsyslogd -n
