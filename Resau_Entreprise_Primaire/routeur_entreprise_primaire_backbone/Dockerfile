# Utiliser l'image de base FRR
FROM frrouting/frr:latest

# Copier les fichiers de configuration
COPY frr.conf /etc/frr/frr.conf
COPY daemons /etc/frr/daemons
COPY config.sh /usr/local/bin/script.sh

# Rendre le script exécutable
RUN chmod +x /usr/local/bin/script.sh

# Commande par défaut pour démarrer le conteneur
CMD ["/usr/local/bin/script.sh"]
