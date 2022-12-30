export GITLAB_HOME=/srv/gitlab
mkdir -p docker/gitlab
cd docker/gitlab
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/gitlab/docker-compose.yml
nvim docker-compose.yml
sudo docker compose up -d
cd
