# Utiliser l'image de base FRR
FROM frrouting/frr:latest

# Copier les fichiers de configuration
COPY frr.conf /etc/frr/frr.conf
COPY daemons /etc/frr/daemons
COPY config1.sh /usr/local/bin/config1.sh

# Rendre le script exécutable
RUN chmod +x /usr/local/bin/config1.sh

# Commande par défaut pour démarrer le conteneur
CMD ["/usr/local/bin/config1.sh"]
