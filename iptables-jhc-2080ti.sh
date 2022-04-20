#!/bin/bash

# tcp
iptables -t nat -N clash_local
iptables -t nat -A clash_local -m owner --uid-owner 65534 -j RETURN
iptables -t nat -A clash_local -d 0.0.0.0/8 -j RETURN
iptables -t nat -A clash_local -d 10.0.0.0/8 -j RETURN
iptables -t nat -A clash_local -d 127.0.0.0/8 -j RETURN
iptables -t nat -A clash_local -d 169.254.0.0/16 -j RETURN
iptables -t nat -A clash_local -d 172.16.0.0/12 -j RETURN
iptables -t nat -A clash_local -d 192.168.0.0/16 -j RETURN
iptables -t nat -A clash_local -d 224.0.0.0/4 -j RETURN
iptables -t nat -A clash_local -d 240.0.0.0/4 -j RETURN
iptables -t nat -A clash_local -p tcp -j REDIRECT --to-port 7892
iptables -t nat -A clash_local -p icmp -j REDIRECT --to-port 7892
iptables -t nat -A OUTPUT -p tcp -j clash_local
iptables -t nat -A OUTPUT -p icmp -j clash_local

