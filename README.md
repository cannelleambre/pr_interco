# pr_interco

## Commande pour le reseau particulier
docker-compose -f .\projet_interco.yml up -d (lancer les conteneurs)  
docker exec -it router bash   
(une fois dans le bash du routeur/box faire)   
nano etc/default/isc-dhcp-server   
INTERFACESv4="" --> INTERFACESv4="eth0" (ajouter l'interface eth0 pour indiquer l'interface qui va gérer les requêtes DHCP)  
service isc-dhcp-server start (lancer les service DHCP)  
exit (quitter le bash du routeur)  

docker exec -it client bash  
ip a (pour voir quelle adresse à notre client)  
(s'il a déjà une adresse sur son interface eth0)  
ip a d @ dev eth0 (pour supprimer cette adresse)  
(sinon)   
dhclient eth0 (pour envoyer la requête DHCP au routeur/box)    
ip a (pour vérifier que la nouvelle adresse attribuer est bien dans la bonne plage d'adresse)   
ip route add default via 192.168.1.3 (pour ajouter la route par défaut s'il elle n'existe pas)  

tester la connexion entre le routeur/box et le client avec les pings  
