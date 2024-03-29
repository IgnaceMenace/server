*Knowledge, script and config files I need to setup my personal server.*

# Why
- Self hosted services preserve your privacy
- Since we are far from a fully decentralized internet you need to be able to host your services to keep control
- Free terabytes of cloud storage if you collect old hardware
- Fedora server as a host OS because Canonical has proven by the past that they aren't the most concerned about freedom, so no Ubuntu. I don't believe in the forks of Ubuntu because they are far from innovative and autonomous
- You could easily adapt this script to Arch or Debian but with the first one you won't have the same stability and built in tools and with the second one you will potentially miss some drivers. That being said, both are still pretty much as good as Fedora.

# What's included
- Nextcloud AIO
- Nginx Proxy Manager
- Portainer
- Cockpit
- Wireguard Easy
Nextcloud AIO probably has all the feature you need, you can even install some additional community containers for additional unsupported features

# Before installing
- Install Fedora Server
  - No root account
  - Disk encription is absolutely needed when selfhosting, for security purpose, you could enbale encription from your services but disk encription is much easier/faster
  - Please use a strong password
  - Check the size of your disk parition, Fedora usualy creates a small 15gB root partition
- Create a DNS zone on a DNS provider website
- Create an A record
- Make your server local IP static for a better stability
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
Firstly you should create a proxy host on Nginx with an ssl certificate and forward to the port 11000. Then you can go to the port 8080 with https and launch the installation of nextcloud AIO from the interface.

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

## Resolve common error
- Missing default region
```
sudo docker exec --user www-data nextcloud-aio-nextcloud php occ config:system:set default_phone_region --value=BE
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
- Find a way to decrypt hard drive automatically or at distance when fedora does a reboot after update
https://fedoramagazine.org/automatically-decrypt-your-disk-using-tpm2/
- Setup other services
  - Gitlab for version control
  - Vault/Bitwarden
  - Language tool for grammar and spelling check
  - ESS (matrix) for global communication
  - SearXNG
  - Adguard
  - Email for password reset on nextcloud
  - I2P and Tor/Arti
  - Watchtower for automatic updates
- Think about switching as much container as possible to podman
  - Not needed at all, just for fun

# Personal thought
*After a few years of usage*
- Nextcloud AIO is a great tool to provide most of the services a normal user would need to replace all his proprietary online services, but it comes with the downside of being slow and often buggy
  - I personnaly 100% depend on it for
    - File sharing
    - File syncing
    - Backup
    - Contact
    - Calendar
    - Note
  - Provides a lot of **usefull** features
  - Provides a lot of **useless** features
  - Written in PHP
    - I admit I've never used it but
      - It's slow
      - A rewrite like OwnCloud Infinit Scale could be beneficial
  - Some services tend to be so demending that it slows down everything runing on the server
  - AI features
    - It is a good thing
    - But they should spend more time on bug fixing than feature building
  - You can't upload a folder by clicking on "new/import/folder" which is fondamentaly absurd
    - You can only drag and drop it, which makes even less sens that it isn't available with a file picker option
  - I would like to switch to a better alternative
    - Either I host a lot of services that I self manage
    - Either I wait for the very promising OwnCloud Infinite Scale which is fast and easy to run
    - Either I trust Nextcloud for the futur improvement they will add to the software
    - Either I build my own simple dav server in Rust
**I will continue to trust Nextcloud while I wait to see what OCIS can do, the Nextcloud team is passionated and I hope they will improve their software as much as possible** 
