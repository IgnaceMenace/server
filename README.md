# Server
Knowledge, script and config files I need to setup my personal server
# Before installing
- Install Fedora Server
  - No root account
  - Encryption isn't required since most services provide their own
  - Please use a strong password
- Create a DNS zone
- Create an A record
- Make your server local IP Static
- You shouldn't run a script you haven't checked before
- Please check the script you want to run and edit it to your liking
# Base install
## Multiple services

Open the ports in your router and your internet provider !
```
TCP/UDP => 80
TCP/UDP => 443
TCP/UDP => 3478
```

Then run
```
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/setupFedS.sh 
sudo chmod +x setupFedS.sh
bash setupFedS.sh
```
You are now able to access nginx on port 81, portainer on port 9443 and nextcloud on port 8080. 
Firstly you should create a proxy host on Nginx with an ssl certificate and forward to the port 11000. Then you can go to the port 8080 and launch the instalation ofnextcloud AIO from the interface.
## Only Nextcloud AIO

Open the ports in your router and your internet provider !
```
TCP/UDP => 80
TCP/UDP => 443
TCP/UDP => 3478
TCP/UDP => 8080
TCP/UDP => 8443
```
Then run
```
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/setupFedSNAIOOnly.sh 
sudo chmod +x setupFedSNAIOOnly.sh
bash setupFedSNAIOOnly.sh
```
## Install something from a `docker-compose.yml` file
```
sudo docker compose up -d
```
# NginX Proxy manager
*Default credential*
```
Email:    admin@example.com
Password: changeme
```
# Nextcloud
*Get the Setup Password if lost*
```
sudo cat /var/lib/docker/volumes/nextcloud_aio_mastercontainer/_data/data/configuration.json | grep password
```
# Useful websites
[ClouDNS](https://www.cloudns.net/)

[IPChicken](https://www.ipchicken.com/)

# Additional config

## List open ports
```
sudo firewall-cmd --list-ports
```
more info [here](https://docs.fedoraproject.org/en-US/quick-docs/firewalld/)

# Road Map
- Find a way to decrypt hard drive automatically or at distance when fedora does a reboot after update
- Setup other usefull services (GitLab, Bitwarden, language tool, synapse, searxNG, adguard, Wireguard, OwnCloud Infinite Scale, Email)
- Move to Fedora CoreOS or IoT
