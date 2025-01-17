# Utiliser une image Alpine légère
FROM nginx:latest

# Installer Apache (serveur web) et outils réseau
RUN apk add --no-cache apache2 bash iproute2

# Créer un dossier pour les fichiers HTML
RUN mkdir -p /var/www/localhost/htdocs

# Copier le fichier HTML pour la page d'accueil
COPY index.html /var/www/localhost/htdocs/

# Copier le script de configuration réseau
COPY config.sh /home/
RUN chmod +x /home/config.sh

# Copier le fichier de configuration nginx.conf dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port HTTP
EXPOSE 80

# Commande par défaut pour démarrer le serveur web
CMD ["/home/config.sh"]

