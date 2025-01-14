
FROM ubuntu:latest
# Installer isc-dhcp-client
RUN apt-get update && apt-get install -y \
 iptables iproute2 net-tools systemd telnet nano iputils-ping tcpdump \
 isc-dhcp-client \
 && apt-get clean

# Copie de la configuration Réseau
COPY config.sh /config.sh

# Rendre le script exécutable
RUN chmod +x /config.sh

#Lancement de la configuration du réseau au démarrage du conteneur
CMD ["/config.sh"]

