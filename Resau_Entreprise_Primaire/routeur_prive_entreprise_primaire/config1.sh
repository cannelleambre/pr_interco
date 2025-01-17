#!/bin/sh

# Mettre les interfaces réseau en UP
ip link set dev eth0 up
ip link set dev eth1 up
ip link set dev eth2 up

# Configurer les adresses IP des interfaces
ip addr add 192.168.0.3/25 dev eth0
ip addr add 120.0.82.126/25 dev eth1
ip addr add 120.0.83.126/25 dev eth2

# Activer le routage IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Ajouter une route par défaut via 120.0.83.126
ip route add default via 120.0.83.126


#Lancer les demons FRR et Configurer OSPF via vtysh
vtysh <<-EOF
configure terminal
router ospf
router-id 1.1.1.3
network 120.0.82.0/25 area 0
network 120.0.83.128/25 area 0
network 192.168.0.0/25 area 0
exit
exit
write memory
EOF

# Configurer une règle NAT avec iptables pour le routage
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Lancer le service DHCP
service isc-dhcp-server start

# Autoriser le trafic DHCP sur les ports 67 et 68
iptables -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Garde le conteneur actif
sleep infinity


