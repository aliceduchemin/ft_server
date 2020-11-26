# ft_server
[super user]
docker build -t image_name .

docker images

docker run -d -p 80:80 -p 443:443 --name conteneur_name image_ID

docker ps -a

docker exec -ti conteneur_name bash


docker rm -f container_ID

docker rmi image_ID

systemctl status/stop service


localhost
