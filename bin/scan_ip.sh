#!/bin/bash

TRANSFORM=$1

ip=$(/sbin/ip addr show ens1u2u4 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
#ip="10.0.5.0"
base_ip="$(echo $ip | awk -F . '{print $1 "." $2 "." $3 ".0"}')/24"


echo ">> I'm looking for all IP addresses in subnet $base_ip ..."

arp-scan "${base_ip}" | grep "[0-9a-f]:[0-9a-f]" |
while IFS= read -r ip_mac; do
  if [ -n "$TRANSFORM" ]; then
    ip_mac=$(echo "$ip_mac" | tr ':' '-'  | tr '[:lower:]' '[:upper:]')
  fi
  echo $ip_mac
done

exit 0

