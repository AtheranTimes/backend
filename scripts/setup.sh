# uodate packages
dnf update

# go to home dir
cd ~

# download docker
curl -fsSL https://get.docker.com -o get-docker.sh
# install docker
sh get-docker.sh

# allow non-root users to use docker
#dockerd-rootless-setuptool.sh install

# download docker compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# apply perms
chmod +x /usr/local/bin/docker-compose

# syslink
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# install git
dnf install git -y

# download backend config
git clone https://github.com/AtheranTimes/backend backend

# download plausible config
git clone https://github.com/AtheranTimes/plausible-hosting plausible

# start docker
sudo systemctl start docker

# automatically start Docker and Containerd on boot
systemd enable docker.service
systemd enable containerd.service