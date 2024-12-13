# Utiliser une image Alpine minimaliste pour un serveur léger
FROM alpine:latest

# Installer les dépendances nécessaires
RUN apk add --no-cache bind bind-tools iproute2 bash

# Créer les répertoires nécessaires pour BIND
RUN mkdir -p /etc/bind/zones

# Copier les fichiers de configuration
COPY named.conf /etc/bind/
COPY named.conf.options /etc/bind/
COPY zones/entreprise.primaire.db /etc/bind/zones/

# Copier le script de configuration réseau
COPY config.sh /home/
RUN chmod +x /home/config.sh

# Exposer les ports DNS
EXPOSE 53/tcp
EXPOSE 53/udp

# Démarrer le serveur DNS via le script
CMD ["/home/config.sh"]

