#!/bin/bash
sleep 60
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository -y ppa:maarten-fonville/android-studio
apt update
apt install -y docker-ce docker-ce-cli containerd.io openjdk-11-jdk
gpasswd -a ubuntu docker

docker build -t jenkins:01 - < /tmp/Dockerfile
mkdir /var/jenkins_home && chmod 777 /var/jenkins_home
docker container run --name jenkins --restart always --detach --publish 80:8080  --publish 50000:50000 --volume /var/jenkins_home:/var/jenkins_home jenkins:01