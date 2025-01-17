#!/bin/bash

# Activer les interfaces réseau
ip link set dev eth0 up
ip link set dev eth1 up
ip link set dev eth2 up

# Configurer les adresses IP sur les interfaces
ip addr add 120.0.82.127/25 dev eth0  # Réseau primaire2
ip addr add 120.0.82.254/25 dev eth1  #  Réseau primaire1
ip addr add 120.0.85.131/25 dev eth2  # Réseau services 

# Activer le routage IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configurer les routes pour les autres réseaux
ip route add default via 120.0.82.253

#Lancer les demons FRR et Configurer OSPF via vtysh
vtysh <<-EOF
configure terminal
router ospf
router-id 1.1.1.3
network 120.0.85.128/25 area 0
 network 120.0.82.128/25 area 0
 network 120.0.82.0/25 area 0
exit
exit
write memory
EOF

#echo "Démarrage des services FRR..."
#service frr start
#echo "Configuration terminée avec succès."

# Configurer le NAT (Network Address Translation)
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Permettre le transfert de paquets entre les interfaces
#iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
#iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
#iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
#iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT

# Lancer le service DHCP sur toutes les interfaces
#dhcpd -cf /etc/dhcp/dhcpd.conf eth0 eth1 eth2
