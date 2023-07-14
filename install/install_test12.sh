#!/bin/sh

apt update
apt clean

echo "\e[1;34mInstalling gnupg\e[0m"
apt install -y gnupg
echo "\e[1;33mInstallation gnupg is complete\e[0m"

echo "\e[1;34mInstalling net-tools\e[0m"
apt install -y net-tools
echo "\e[1;33mInstallation net-tools is complete\e[0m"

echo "\e[1;34mInstalling bash-completion\e[0m"
apt install -y bash-completion
echo "\e[1;33mInstallation bash-completion is complete\e[0m"

echo "\e[1;34mInstalling ca-certificates\e[0m"
apt install -y ca-certificates
echo "\e[1;33mInstallation is complete\e[0m"

echo "\e[1;34mInstalling Curl\e[0m"
apt install -y curl
echo "\e[1;33mInstallation Curl is complete\e[0m"

echo "\e[1;34mInstalling apt-transport-https\e[0m"
apt install -y apt-transport-https
echo "\e[1;33mInstallation apt-transport-https is complete\e[0m"

echo "\e[1;34mInstalling Midnight Commander\e[0m"
apt install -y mc
echo "\e[1;33mInstallation midnight commander is complete\e[0m"

echo "\e[1;34mInstalling Nano\e[0m"
apt install -y nano
echo "\e[1;33mInstallation Nano is complete\e[0m"

echo "\e[1;34mInstalling Htop\e[0m"
apt install -y htop
echo "\e[1;33mInstallation Htop is complete\e[0m"

echo "\e[1;34mInstalling software-properties-common\e[0m"
apt install -y software-properties-common
echo "\e[1;33mInstallation software-properties-common is complete\e[0m"

echo "\e[1;34mInstalling jenkins\e[0m"
apt update
apt install -y default-jre
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update
apt install -y jenkins
systemctl start jenkins
echo "\e[1;33mInstallation jenkins is complete\e[0m"

echo "\e[1;34mInstalling docker and docker-compose\e[0m"
#https://docs.docker.com/engine/install/ubuntu/
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
apt install -y docker-compose
echo "\e[1;33mInstallation docker and docker-compose are complete\e[0m"

echo "\e[1;31mFull install is complete! Congratulations!\e[0m"



