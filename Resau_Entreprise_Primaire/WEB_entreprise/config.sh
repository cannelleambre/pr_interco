#!/bin/bash

# Activer l'interface réseau
ip link set dev eth0 up
ip addr add 120.0.82.4/23 dev eth0

# Ajouter la route par défaut
ip route add default via 120.0.82.7

# Démarrer le serveur web Apache
httpd -D FOREGROUND