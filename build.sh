# Pull base Docker image
docker pull metabase/metabase

# Tag Docker Image according to DP standard for GCR usage
docker tag metabase/metabase:latest fabianschyrer/metabase.docker:latest

# Delete generic base Docker image
docker rmi metabase/metabase:latest 
