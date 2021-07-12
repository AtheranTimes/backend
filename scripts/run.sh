# if error exit
set -e

# display each cmd run
set -x

# go to home dir
cd ~

# go to backend config
cd backend

# update repo with newest changes
git pull --rebase

# run stack
docker-compose -f stack.yml -f traefik/proxy.yml -f plausible/plausible.yml -f portainer/portainer.yml up -d

# go to home dir
# cd ~

# go to plausible
# cd plausible

# update repo with newest changes
# git pull

# run stack
# docker-compose -f docker-compose.yml -f reverse-proxy/traefik/docker-compose.traefik.yml up -d