sudo docker pull caddy
mkdir docker/caddy
touch docker/caddy/Caddyfile

# OR

sudo dnf install 'dnf-command(copr)'
sudo dnf copr enable @caddy/caddy
sudo dnf install caddy
