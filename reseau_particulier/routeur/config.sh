#!/bin/bash


# Activer le forwarding IP
echo 1 > /proc/sys/net/ipv4/ip_forward


ip route add default via 120.0.84.2

# Configuration NAT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth1 -j MASQUERADE

# Politique par défaut : bloquer tout
iptables -P FORWARD DROP

# Autoriser le trafic ICMP (Ping)
#iptables -A FORWARD -p icmp -j ACCEPT


# Autoriser le trafic HTTP (port 80)
iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -p tcp --sport 80 -j ACCEPT

# Autoriser le trafic DNS (port 53 UDP)
iptables -A FORWARD -s 192.168.1.0/24 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -d 192.168.1.0/24 -p udp --sport 53 -j ACCEPT

# Bloquer tout autre trafic (par défaut)
iptables -A FORWARD -j DROP

# Garder le conteneur actif
exec sleep infinity
