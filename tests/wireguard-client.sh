#!/usr/bin/env bash

set -euxo pipefail

crudini --set configs/10.0.8.100/wireguard/desktop.conf Interface Table off

wg-quick up configs/10.0.8.100/wireguard/desktop.conf

wg

ifconfig desktop

ip route add 172.16.0.1/32 dev desktop

fping -t 900 -c3 -r3 -Dse 10.0.8.100 172.16.0.1

wg | grep "latest handshake"

host google.com 172.16.0.1

echo "WireGuard tests passed"

wg-quick down configs/10.0.8.100/wireguard/desktop.conf
