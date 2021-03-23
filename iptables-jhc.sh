#!/bin/bash

# tcp
iptables -t nat -N clash
iptables -t nat -A clash -d 0.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 10.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 127.0.0.0/8 -j RETURN
iptables -t nat -A clash -d 169.254.0.0/16 -j RETURN
iptables -t nat -A clash -d 172.16.0.0/12 -j RETURN
iptables -t nat -A clash -d 192.168.0.0/16 -j RETURN
iptables -t nat -A clash -d 224.0.0.0/4 -j RETURN
iptables -t nat -A clash -d 240.0.0.0/4 -j RETURN
iptables -t nat -A clash -d 202.120.40.102 -j RETURN
iptables -t nat -A clash -p tcp -j REDIRECT --to-port 7892
iptables -t nat -A clash -p icmp -j REDIRECT --to-port 7892
iptables -t nat -A PREROUTING -s 10.2.0.0/16 -p tcp -j clash
iptables -t nat -A PREROUTING -s 10.3.0.0/16 -p tcp -j clash
iptables -t nat -A PREROUTING -s 10.2.0.0/16 -p icmp -j clash
iptables -t nat -A PREROUTING -s 10.3.0.0/16 -p icmp -j clash

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
iptables -t nat -A clash_local -d 202.120.40.102 -j RETURN
iptables -t nat -A clash_local -p tcp -j REDIRECT --to-port 7892
iptables -t nat -A clash_local -p icmp -j REDIRECT --to-port 7892
iptables -t nat -A OUTPUT -p tcp -j clash_local
iptables -t nat -A OUTPUT -p icmp -j clash_local

# udp
ip rule add fwmark 1 table 100
ip route add local default dev lo table 100
iptables -t mangle -N clash
iptables -t mangle -A clash -d 0.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A clash -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A clash -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A clash -d 192.168.0.0/16 -j RETURN
iptables -t mangle -A clash -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A clash -d 240.0.0.0/4 -j RETURN
iptables -t mangle -A clash -d 202.120.40.102 -j RETURN
iptables -t mangle -A clash -p udp -j TPROXY --on-port 7892 --tproxy-mark 1
iptables -t mangle -A PREROUTING -s 10.2.0.0/16 -p udp -j clash
iptables -t mangle -A PREROUTING -s 10.3.0.0/16 -p udp -j clash
