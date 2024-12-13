# Image de base minimale
FROM alpine:latest

# Installation des outils nécessaires
RUN apk add --no-cache iproute2 iptables vsftpd

# Création d'un utilisateur pour le FTP (si nécessaire)
RUN adduser -D -h /home/ftpuser ftpuser && \
    echo "ftpuser:ftppassword" | chpasswd

# Configuration des répertoires FTP
RUN mkdir -p /home/ftpuser/ftp && \
    chmod 755 /home/ftpuser/ftp && \
    chown ftpuser:ftpuser /home/ftpuser/ftp

# Copier le fichier de configuration pour le serveur FTP
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

# Copier le script de configuration réseau 
COPY config.sh /config.sh

# Rendre le script exécutable
RUN chmod +x /config.sh

# Activer la redirection IP (si nécessaire)
RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

# Exposer les ports nécessaires pour le FTP (21 + plage passif si configurée)
EXPOSE 21
EXPOSE 10000-10010

# Commande par défaut à exécuter au démarrage du conteneur 
CMD ["/config.sh", "&&", "vsftpd", "/etc/vsftpd/vsftpd.conf"]
