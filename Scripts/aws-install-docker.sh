#!/bin/bash

# Install docker on Amazon Linux 2

sudo yum update -y
  
sudo amazon-linux-extras install docker

sudo service docker start

sudo usermod -a -G docker ec2-user

docker info

# Install docker-compose

sudo chkconfig docker on

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

# To start a docker swarm and make this machine the manager
#docker swarm init --advertise-addr x.x.x.x