# for fedora server
sudo sed -i 's/FirewallBackend=nftables/FirewallBackend=iptables/g' /etc/firewalld/firewalld.conf
sudo systemctl restart firewalld docker
# For x64 CPUs:
sudo docker run \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 8080:8080 \
-e APACHE_PORT=11000 \
# if you can't validate your domain uncomment this (but i think you still need to write a domain but it s going to by pass 
#-e SKIP_DOMAIN_VALIDATION=true \
-v nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
nextcloud/all-in-one:latest
