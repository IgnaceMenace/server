# Server
Knowledge, script and config files I need to setup my personal server
# Why ?
- Self hosted services preserve your privacy
- Canonical has proven by the past that they aren't the most concerned about freedom, so Ubuntu is shit you better of using Fedora Server
  - You could easily adapt this script to Arch or Debian but with the first one you won't have the same stability and built in tools and with the second one you will potentially miss some drivers. That being said, both are still pretty much as good as Fedora
- Since we are far from a fully decentralized internet you need to be able to host your services
- Free terabytes of cloud storage if you collect old hardware

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
Firstly you should create a proxy host on Nginx with an ssl certificate and forward to the port 11000. Then you can go to the port 8080 with https and launch the instalation of nextcloud AIO from the interface.

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
## Config
The configuration for your nextcloud proxy
```
client_max_body_size 0;
fastcgi_connect_timeout 600;
fastcgi_send_timeout 1800;
fastcgi_read_timeout 1800;
proxy_connect_timeout 1d;
proxy_send_timeout 1d;
proxy_read_timeout 1d;
send_timeout 1d;
```

# Nextcloud
*Get the Setup Password if lost*
```
sudo cat /var/lib/docker/volumes/nextcloud_aio_mastercontainer/_data/data/configuration.json | grep password
```
# Useful websites
[ClouDNS](https://www.cloudns.net/)

[IPChicken](https://www.ipchicken.com/)

# List open ports on Fedora
```
sudo firewall-cmd --list-ports
```
more info [here](https://docs.fedoraproject.org/en-US/quick-docs/firewalld/)

# Road Map
- Add the wireguard configuration
- Find a way to decrypt hard drive automatically or at distance when fedora does a reboot after update
https://fedoramagazine.org/automatically-decrypt-your-disk-using-tpm2/
- Update containers with watchtower
- Setup other usefull services (GitLab, Bitwarden, language tool, synapse, searxNG, adguard, Wireguard, OwnCloud Infinite Scale, Email, I2P, Tor)
- Move to Fedora IoT
- Move from Docker to Podman

# Personal thought
*After a few month of usage*
- Nextcloud is slow and buggy
  - Provides a lot of useless features
  - Supposedly makes everything less stable than it could be
  - Written in PHP
    - I admit I've never used it but
      - It's slow
      - A rewrite like Owncloud Infinit Scale could be beneficial
  - I would like to switch to a better alternative
    - Syncthing
    - OCIS
- Docker is fine a podman doesn't seem to be the easiest way to go at all so I think it will never be used instead of docker and we will just switch to WASM at some point
- Fedora IoT won't give me anything better than current Fedora Server
- Security is important so maybe I should considere using Syncthing or OCIS strictly over Wireguard tunnel
- Current connection not good enough to install Tor, adguard, searxng etc
- If I move to OCIS or syncthing a dendrite server could be useful
