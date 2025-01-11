#!/bin/bash

# Met à jour les paquets et installe Asterisk
apt-get update
apt-get install -y asterisk

# Copie les fichiers de configuration nécessaires (ajoutez-les dans votre conteneur)
cp /etc/asterisk/sip.conf /etc/asterisk/sip.conf.bak
cp /config_files/sip.conf /etc/asterisk/sip.conf

# Redémarre le service Asterisk
service asterisk restart

echo "Configuration du serveur VoIP terminée."

