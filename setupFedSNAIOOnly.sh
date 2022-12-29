# DNF tweak for performance
sudo sed -i '9i\fastestmirror=true' /etc/dnf/dnf.conf
sudo sed -i '10i\max_parrallel_downloads=10' /etc/dnf/dnf.conf
sudo dnf clean all

# Update system
sudo dnf update -y

# Firmware update
sudo fwupdmgr refresh
sudo fwupdmgr get-updates
sudo fwupdmgr update

# Add repositories
sudo dnf install \
https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
-y
sudo dnf config-manager \
--add-repo \
https://download.docker.com/linux/fedora/docker-ce.repo

# Remove some software
sudo dnf remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine \
-y

# Install dependencies and usefull light pckages
sudo dnf install \
neovim \
ranger \
util-linux-user \
NetworkManager \
NetworkManager-tui \
toolbox \
pip \
htop \
btop \
bmon \
neofetch \
asciiquarium \
cmatrix \
git \
nmap \
tmux \
foot \
cockpit-pcp \
dnf-automatic \
dnf-plugins-core \
docker-ce \
docker-ce-cli \
containerd.io \
docker-compose-plugin \
npm \
-y 

# Enable services
sudo systemctl enable NetworkManager
sudo systemctl enable docker
sudo systemctl start docker

# Opening ports from firewall
#sudo firewall-cmd --add-port=80/udp
#sudo firewall-cmd --add-port=80/tcp
#sudo firewall-cmd --add-port=443/udp
#sudo firewall-cmd --add-port=443/tcp
#sudo firewall-cmd --runtime-to-permanent
# Ends up not being usefull

# Install from different sources

## Install some utilities from pip
pip install tmuxp

# Disable lid switch for laptop
sudo sh -c "echo 'HandleLidSwitch=ignore' >> /etc/systemd/logind.conf"
sudo sh -c "echo 'LidSwitchIgnoreInhibited=yes' >> /etc/systemd/logind.conf"

# Docker services 

## Portainer
### Creating volume for database
sudo docker volume create portainer_data
### Installing portainer with privilege since we are using SELinux
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --privileged --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

## Nextcloud
# For x64 CPUs:
sudo docker run \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 80:80 \
--publish 8080:8080 \
--publish 8443:8443 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
nextcloud/all-in-one:latest