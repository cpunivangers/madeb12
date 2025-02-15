#!/bin/bash
 
# 19/09/2023
# christian.pottier@univ-angers.fr
#  
# XDEB11 to XDEB12
# curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/playbooks/files/Divers/xdeb11toxdeb12.sh | bash

#~ # test bash
#~ if [ -z $BASH ]; then
	#~ echo "Lancer avec bash !"
	#~ exit 1
#~ fi

sudo apt -y purge madeb
sudo rm -rf /opt/madeb
sudo rm -rf /opt/deb_perso
sudo rm -rf /opt/ansible/*

# paquets pouvant poser pb
sudo apt -y purge virtualbox-6.1
sudo apt -y purge ".*:i386"
sudo apt -y purge libdvd-pkg
sudo dpkg --remove-architecture i386
# Debian 12 remplacement pulseaudio par pipewire
sudo apt -y remove pulseaudio*

# téléchargement de madeb12
curl -sL curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/update_madeb12.sh > update_madeb12.sh

bash update_madeb12.sh download

sudo mv /etc/apt/sources.list.d /etc/apt/sources.list.d11

# mise à jour Debian 11 avant mise à jour
sudo apt update -y --allow-releaseinfo-change
sudo apt full-upgrade -y

# Nettoyage
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y

# Debian 12
sudo cp /opt/ansible/madeb12/playbooks/files/sources.list /etc/apt/sources.list
sudo apt update -y --allow-releaseinfo-change

# Espace disque nécessaire
sudo apt full-upgrade --assume-no
df -h /

echo "Avez-vous l'espace suffisant pour effectuer cette mise à jour ?"
echo -n "Continuer ... (ou faire CTRL+C pour arrêter le script)" ; read tempo

# Mise à jour version
sudo DEBIAN_FRONTEND=noninteractive apt -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" full-upgrade -y

# Suppression des fichiers config restant
sudo apt list '~c'
sudo apt purge '~c'

# installation madeb12 en forcant update
rm /opt/ansible/madeb12/Version.txt
bash /opt/ansible/madeb12/update_madeb12.sh
