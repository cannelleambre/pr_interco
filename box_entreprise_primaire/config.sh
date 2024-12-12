ip link set dev eth0 up
ip link set dev eth1 up
ip a a 192.168.1.3/23 dev eth0
ip a a 120.0.82.8/23 dev eth1

# Activer le routage IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

ip route add 120.0.82.8/23 via 120.0.82.8
ip route add 120.0.85.128/25 via 120.0.82.8
ip route add 120.0.84.128/25 via 120.0.82.8
ip route add 120.0.84.0/25 via 120.0.82.8
# route par défaut 
ip route add default via 120.0.82.8


# Configurer une règle NAT avec iptables pour le routage
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Lancer les services DHCP ISC
service isc-dhcp-server start 

# Autoriser le traffic DHCP sur les ports 67 et 68 utilisés
# par DHCP
iptables -A INPUT -i eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

