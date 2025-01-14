
# Utilisation d'une image Debian de base
FROM debian:bullseye-slim

# Mise à jour et installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
  iptables iproute2 net-tools systemd telnet nano iputils-ping tcpdump \
  isc-dhcp-server procps \
  && apt-get clean

# Copier la configuration du serveur DHCP dans le conteneur
COPY ./dhcpd.conf /etc/dhcp/dhcpd.conf

# Copier le script entrypoint.sh dans le conteneur
COPY ./config.sh /config.sh

# Donner les permissions d'exécution au script entrypoint.sh
RUN chmod +x /config.sh

# Exposer les ports nécessaires pour le serveur DHCP (67)
EXPOSE 67/udp

# Utiliser le script entrypoint.sh comme commande d'entrée
CMD ["/config.sh"]
