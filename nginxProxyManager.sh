mkdir -p docker/nginxProxyManager
cd docker/nginxProxyManager
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/nginxProxyManager/docker-compose.yml
sudo docker compose up -d
