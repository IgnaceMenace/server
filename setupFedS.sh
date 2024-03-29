# DNF tweak for performance
sudo cat >> /etc/dnf/dnf.conf << EOF                                                                         
fastestmirror=true                                                                                           
max_parrallel_downloads=10                                                                                                                                                                                         
EOF
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
ranger \
util-linux-user \
NetworkManager \
NetworkManager-tui \
mc \
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
cockpit-podman \
dnf-automatic \
dnf-plugins-core \
docker-ce \
docker-ce-cli \
containerd.io \
docker-compose-plugin \
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
## Install Ookla internet speed test 
## Warning : This one is NOT open source
#curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
#sudo dnf install speedtest

## Install some utilities from pip
#tmuxp for automated tmux config
#pip install tmuxp

# Disable lid switch for laptop
# If your server is a laptop you need to run this to prevent it to suspend when closed
sudo sh -c "echo 'HandleLidSwitch=ignore' >> /etc/systemd/logind.conf"
sudo sh -c "echo 'LidSwitchIgnoreInhibited=yes' >> /etc/systemd/logind.conf"

# Docker services 

## Portainer
### Creating volume for database
sudo docker volume create portainer_data
### Installing portainer with privilege since we are using SELinux
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --privileged --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

## Nginx Proxy Manager
mkdir -p docker/nginxProxyManager
cd docker/nginxProxyManager
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/nginxProxyManager/docker-compose.yml
sudo docker compose up -d
cd

## Nextcloud
mkdir -p docker/nextcloud
cd docker/nextcloud
wget https://raw.githubusercontent.com/IgnaceMenace/server/main/nextcloud/docker-compose.yml
nvim docker-compose.yml
sudo docker compose up -d
cd

## Gitlab
