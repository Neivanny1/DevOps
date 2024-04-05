# Base image with Jenkins and Java 17
FROM jenkins/jenkins:2.440.2-jdk17

# Switch to root for package installation
USER root

# Update package lists (consider combining these)
RUN apt-get update

# Install dependencies for Docker
RUN apt-get install -y lsb-release

# Add Docker repository key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# Add Docker repository to sources list
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Update package lists again
RUN apt-get update

# Install Docker client
RUN apt-get install -y docker-ce-cli

# Switch back to Jenkins user
USER jenkins

# Set update center URL
ENV JENKINS_UC=https://updates.jenkins.io/current/update-center.json

# Install plugins with potentially safer versions (check for updates)
RUN jenkins-plugin-cli --plugins "blueocean:latest docker-workflow:latest"

# (Optional) Alternative plugins if upgrading Jenkins is not possible
# Replace these placeholders with compatible plugin names and versions
# RUN jenkins-plugin-cli --plugins "alternative-multibranch-plugin:version alternative-folder-plugin:version"
