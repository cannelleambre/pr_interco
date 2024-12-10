
# Utilisation d'une image Debian de base
FROM debian:bullseye-slim

# Mise à jour et installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
  iptables iproute2 net-tools systemd telnet nano iputils-ping tcpdump \
  isc-dhcp-server procps \
  && apt-get clean

# Copier la configuration du serveur DHCP dans le conteneur
COPY ./dhcpd.conf /etc/dhcp/dhcpd.conf

# Exposer les ports nécessaires pour le serveur DHCP (67)
EXPOSE 67/udp

# Entrypoint pour démarrer le service DHCP et autres services nécessaires
CMD /usr/sbin/isc-dhcp-server -f
