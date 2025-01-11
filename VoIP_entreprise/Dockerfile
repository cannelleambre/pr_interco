# Utilise une image Debian comme base
FROM debian:latest

# Met à jour les paquets et installe les dépendances
RUN apt-get update && apt-get install -y asterisk

# Copie les fichiers nécessaires (comme le script de configuration et les fichiers SIP)
COPY config.sh /usr/local/bin/config.sh
COPY config_files /config_files
COPY config_files /etc/asterisk

# Donne les permissions d'exécution au script
RUN chmod +x /usr/local/bin/config.sh

# Définit le script comme point d'entrée
ENTRYPOINT ["/usr/local/bin/config.sh"]

