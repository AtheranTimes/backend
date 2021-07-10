# uodate packages
dnf update

# go to home dir
cd ~

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh | sh

# download docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# apply perms
sudo chmod +x /usr/local/bin/docker-compose

# syslink
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# dnf install git

# download backend config
git clone https://github.com/AtheranTimes/backend backend

# download plausible config
git clone https://github.com/AtheranTimes/plausible-hosting plausible