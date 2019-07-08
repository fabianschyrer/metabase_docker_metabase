# Create Docker Network
docker network create --driver bridge --subnet 172.0.0.0/29 metabase-network &>/dev/null || :

# Create Encryption Key and Config
./create-encryption-key-and-add-to-env-file.sh

# Run Docker container
docker run --publish 3000:3000 \
  --name metabase \
  --network="metabase-network" \
  --env-file=metabase-env.list \
  --detach \
  fabianschyrer/metabase.docker:latest
