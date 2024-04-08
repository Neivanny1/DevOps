# Installing Jenkins Inside Docker.
## Step 1:
Install docker if not installed: https://docs.docker.com/engine/install/
## Step 2
Pull Jenkins Image for docker hub: <br>
RUN:<br>
<strong>sudo docker pull jenkins/jenkins:lts-jdk17</strong>
## Step 3
Start a jenkins container in background at port 8080 with command:<br>
RUN: <br>
<strong>sudo docker run --rm --name jenkins -p 8080:8080 jenkins/jenkins:lts-jdk17</strong>
## step 4
To access the jenkins server web UI
<br>
Check your machine ip adress: <br>
RUN: <br>
<strong>ifcongig</strong>
<br>
Copy the Ip address and open your web browser, the type: <br>
<strong>http://your_IP:8080</strong><br>
A web UI will open up prompting for password
## Step 5
To get the password: <br>
RUN: <br>
<strong>sudo docker exec jenkinServer cat /var/jenkins_home/secrets/initialAdminPassword</strong>
## Step 6
Voila Jenkins server in now in your docker
## Jenkins Documentation
Link: https://hub.docker.com/r/jenkins/jenkins
## Link to youtube video
Link: https://www.youtube.com/watch?v=QNZNfvrFBMo
