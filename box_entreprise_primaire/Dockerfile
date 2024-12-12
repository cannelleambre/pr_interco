#Image de base minimale
FROM alpine:latest
# Installation des outils nécessaires
RUN apk add --no-cache iproute2 iptables

# Copie du script de configuration réseau 
COPY config.sh /config.sh
# Copier le fichier de configuration du serveur DHCP
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
# Copier le fichier de configuration pour ISC DHCP
COPY isc-dhcp-server /etc/default/isc-dhcp-server

# Rendre le script exécutable
RUN chmod +x /config.sh

# Activation du transdert IP au niveau système (si nécessaire)
# permet au conteneur de fonctionner comme un routeur 
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf  


# Commande par défaut à exécuter au démarrage du conteneur 
CMD ["/config.sh"]

