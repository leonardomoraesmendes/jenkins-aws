#!/bin/bash
sleep 60
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
add-apt-repository -y ppa:maarten-fonville/android-studio
apt update
apt install -y docker-ce docker-ce-cli containerd.io openjdk-11-jdk
gpasswd -a ubuntu docker