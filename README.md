# server
Knowledge, script and config files I need to setup my personal server
# Base install
## Multiple services

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
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/setupFedS.sh 
sudo chmod +x setupFedS.sh
bash setupFedS.sh
```
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
# Additional config

## List open ports
```
sudo firewall-cmd --list-ports
```
more info [here](https://docs.fedoraproject.org/en-US/quick-docs/firewalld/)
