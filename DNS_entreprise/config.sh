#!/bin/bash

# Activer l'interface réseau
ip link set dev eth0 up
ip addr add 120.0.82.2/23 dev eth0

# Ajouter la route par défaut
ip route add default via 120.0.82.7

service bind9 start
