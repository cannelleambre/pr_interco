#!/bin/bash

# Activer l'interface réseau
ip link set dev eth0 up

# Configurer l'adresse IP et le masque de sous-réseau
ip addr add 120.0.82.5/23 dev eth0

# Configurer la passerelle par défaut
#ip route add default via 120.0.85.131/25
