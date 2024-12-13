#!/bin/bash

# Activer les interfaces réseau
ip link set dev eth0 up
ip link set dev eth1 up
ip link set dev eth2 up

# Configurer les adresses IP sur les interfaces
ip addr add 120.0.82.6/23 dev eth0  # Réseau primaire
ip addr add 120.0.82.7/23 dev eth1  # Deuxième IP dans le même réseau
ip addr add 120.0.85.131/25 dev eth2  # Réseau backbone

# Activer le routage IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configurer les routes pour les autres réseaux
ip route add 120.0.85.128/25 dev eth2
ip route add 120.0.82.0/23 dev eth0

# Configurer le NAT (Network Address Translation)
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Permettre le transfert de paquets entre les interfaces
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT

