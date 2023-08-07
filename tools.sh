#!/bin/bash
#echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
sudo apt-get update -y 

cp -R /vagrant/atsea-sample-shop-app /home/vagrant
cp -R /vagrant/counter-app /home/vagrant
cp -R /vagrant/example-voting-app /home/vagrant
cp -R /vagrant/flaskapp /home/vagrant
cp -R /vagrant/simple-webapp-flask /home/vagrant

sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo docker --version

COMPOSE_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')

sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo docker-compose --version

sudo usermod -aG docker $USER

ip -4 addr show

