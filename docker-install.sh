#!/bin/bash

echo "Installing docker"
sudo apt-get update -y
#sudo amazon-linux-extras install docker
#sudo yum install docker
#sudo service docker start
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update -y
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo systemctl status docker
sudo systemctl start docker
echo "$(docker --version)"
echo "docker installation completed"

echo "----------------------------"
echo "staring git installation"
