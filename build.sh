# Pull base Docker image
docker pull metabase/metabase

# Tag Docker Image according to DP standard for GCR usage
docker tag metabase/metabase:latest <DOCKER_REGISTRY>/metabase.docker:latest

# Delete generic base Docker image
docker rmi metabase/metabase:latest 
