# server
Knowledge, script and config files I need to setup my personal server
## nginx
initial run :
login : admin@example.com
password : changeme

## portainer
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --privileged --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
