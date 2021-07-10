# go to home dir
cd ~

# go to backend config
cd backend

# update repo with newest changes
git pull

# run stack
sudo docker-compose -f stack.yml -f ./traefik /traefik.yml up -d