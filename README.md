# Creating Docker Image for Jenkins.
## Step 1:
Install docker in not installed: https://docs.docker.com/engine/install/
## Step 2
Create a bridge network in Docker using the following docker network create command:
RUN:  sudo docker network create jenkins
## Step 3
In order to execute Docker commands inside Jenkins nodes, download and run the docker:dind Docker image using the following docker run command:
RUN: sudo docker run \
  --name jenkins-docker \
  --rm \
  --detach \
  --privileged \
  --network jenkins \
  --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2
