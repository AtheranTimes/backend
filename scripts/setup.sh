# uodate packages
dnf update

# go to usera home dir
cd ~

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh | sh

# download backend config
git clone https://github.com/AtheranTimes/backend backend

# download plausible config
git clone https://github.com/AtheranTimes/plausible-hosting plausible