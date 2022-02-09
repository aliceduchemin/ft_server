# ft_server

Sujet d'administration système : mise en place d'un serveur web via Docker :
- serveur web contenant les services Wordpress, phpMyAdmin et MySQL
- un seul conteneur Docker, construit sur l'image Debian Buster puis implémenté via Dockerfile
- Utilisation du protocole SSL

Commandes :

docker build -t image_name .

docker images

docker run -d -p 80:80 -p 443:443 --name conteneur_name image_ID

docker ps -a

docker exec -ti conteneur_name bash



docker rm -f container_ID

docker rmi image_ID

systemctl status/stop service


localhost
