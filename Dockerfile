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

# Set the JENKINS_UC environment variable to use the official Jenkins update center URL
ENV JENKINS_UC=https://updates.jenkins.io/current/update-center.json

# Install Jenkins plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
