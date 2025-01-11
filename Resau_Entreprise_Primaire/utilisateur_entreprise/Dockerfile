# Image de base minimale 
FROM alpine:latest

# Installation des outils réseau
RUN apk add --no-cache iproute2

# Copie de la configuration Réseau
COPY config.sh /config.sh

# Rendre le script exécutable
RUN chmod +x /config.sh

#Lancement de la configuration du réseau au démarrage du conteneur
CMD ["/config.sh"]


