#!/bin/bash -eux
touch /etc/sysctl.d/disable_ipv6.conf 
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.d/disable_ipv6.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.d/disable_ipv6.conf
sysctl -p /etc/sysctl.d/disable_ipv6.conf && \
: "OK: Disabled IPv6"


