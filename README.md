# Installing Jenkins Inside Docker.
## Step 1:
Install docker in not installed: https://docs.docker.com/engine/install/
## Step 2
Pull Jenkins Image for docker hub: <br>
RUN:<br>
sudo docker pull jenkins/jenkins:lts-jdk17
## Step 3
Start a jenkins container in background at port 8080 with command:<br>
RUN: <br>
sudo docker container run -d --name jenkinServer -p 8080:8080 jenkins/jenkins:lts-jdk17
## step 4
To access the jenkins server web UI
<br>
Check your machine ip adress: <br>
RUN: <br>
ifcongig
<br>
Copy the Ip address and open your web browser, the type: <br>
http://<ip>:8080 <br>
A web UI will open up prompting for password
## Step 5
To get the password: <br>
RUN: <br>
sudo docker exec jenkinServer cat /var/jenkins_home/secrets/initialAdminPassword
## Step 6
Voila Jenkins server in now in your docker
