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
vim \
util-linux-user \
NetworkManager \
NetworkManager-tui \
mc \
toolbox \
pip \
conda \
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

# Install from different sources

## Install some utilities from pip
pip install tmuxp
pip install neovim


# Docker services 

## Nginx proxy manager
## got to create the yml file

## Portainer
sudo docker volume create portainer_data
## Nextcloud

## Gitlab
