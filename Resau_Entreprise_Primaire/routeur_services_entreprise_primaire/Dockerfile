FROM frrouting/frr:latest

# Copier les fichiers de configuration
COPY frr.conf /etc/frr/frr.conf
COPY daemons /etc/frr/daemons
COPY config2.sh /usr/local/bin/config2.sh

# Vérifier la présence du script
RUN ls -l /usr/local/bin/

# Rendre le script exécutable et vérifier
RUN chmod +x /usr/local/bin/config2.sh && ls -l /usr/local/bin/config2.sh

# Commande par défaut pour démarrer le conteneur
CMD ["/usr/local/bin/config2.sh"]
