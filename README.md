# Creating Docker Image for Jenkins.
## Step 1:
Install docker in not installed: https://docs.docker.com/engine/install/
## Step 2
Create a bridge network in Docker using the following docker network create command: <br>
RUN:<br>
sudo docker network create jenkins
## Step 3
In order to execute Docker commands inside Jenkins nodes, download <br>
And run the docker:dind Docker image using the following docker run command: <br>
RUN: <br>
sudo docker run \
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
## step 4
Create a Dockerfile with the following command: <br>
RUN: <br>
echo '
FROM jenkins/jenkins:2.440.2-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
' > Dockerfile
## Step 5
Build a new docker image from this Dockerfile, and assign the image a meaningful name, such as "myjenkins-blueocean:2.440.2-1": <br>
RUN: <br>
sudo docker build -t myjenkins-blueocean:2.440.2-1 .
## Step 6
Run your own myjenkins-blueocean:2.440.2-1 image as a container in Docker using the following docker run command: <br>
RUN: <br>
sudo docker run \
  --name jenkins-blueocean \
  --restart=on-failure \
  --detach \
  --network jenkins \
  --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 \
  --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.440.2-1