#!/bin/bash
 
# 07/09/2023
# christian.pottier@univ-angers.fr
#
if [ -z $BASH ]; then
	echo "Lancer avec bash !"
	exit
fi

# Création des répertoires de base
xdg-user-dirs-update

# Maj Debian
sudo apt update -y --allow-releaseinfo-change
sudo apt full-upgrade -y
# maj madeb Debian
# sudo apt -y install curl
# curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/update_madeb12.sh | bash
OPTION="$1"


if ( sudo apt-cache policy python3-psutil | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y install python3-psutil
fi

## Nouvelle version environnement ansible pip
# Vérif ansible installé
if ! ( sudo apt-cache policy ansible | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y remove ansible
fi

# Vérif environnement ansible pip installé
## Création environnement virtuel python
if ( sudo apt-cache policy python3-venv | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y install python3-venv
fi
sudo mkdir -m 2755 -p /opt/ansible
sudo chown -R $USER:sudo /opt/ansible
python3 -m venv /opt/ansible/vansible

## Activation environnement
source /opt/ansible/vansible/bin/activate
## Mise à jour pip sous l'environnement python
python3 -m pip install --upgrade pip
## Installation ansible
python3 -m pip install --upgrade ansible
ansible --version
## Ajout pour machine windows
python3 -m pip install --upgrade pywinrm
sudo mkdir -m 2755 -p /usr/share/ansible/collections
sudo chown -R $USER:sudo /usr/share/ansible/collections
ansible-galaxy collection install ansible.windows -p /usr/share/ansible/collections/
## fin
deactivate

# Mise à jour du repertoire ansible madeb 12
## Dépendance
if ( sudo apt-cache policy jq | grep Installé | grep -q aucun ) ; then
	sudo apt-get -y install jq
fi

#~ wget -O /tmp/madeb.tar.gz --user-agent=Firefox --no-check-certificate "https://uabox.univ-angers.fr/index.php/s/C50ShQyw6NjT9iD/download"

## Version actuelle
OLD_VERSION=$(head -1 /opt/ansible/madeb12/Version.txt 2>/dev/null)
## Version nouvelle : la dernière
### Dépot Github
repoGit="cpunivangers/madeb12"
latest="https://api.github.com/repos/$repoGit/releases/latest"
VERSION=$(curl -s "$latest" | jq -r '.tag_name')

echo "Version disponible : $VERSION"
echo "Version actuelle   : $OLD_VERSION"
if [ -z "$VERSION" ] ; then
	echo -e $rouge ERREUR Version disponible
	exit
fi
if dpkg --compare-versions "$VERSION" gt "$OLD_VERSION" ; then
	echo "Nouvelle version disponible ..."
else
	echo "Déjà la dernière version"
	exit
fi

sudo rm -f /tmp/madeb.tar.gz

HREF=$(curl -s "$latest" | jq -r '.tarball_url')
wget -O /tmp/madeb.tar.gz $HREF
sudo tar -xzf /tmp/madeb.tar.gz -C /opt/ansible/ --one-top-level=madeb12 --strip-components 1

sudo chown -R $USER:sudo /opt/ansible

# ansible log
sudo mkdir -m 2755 -p /var/log/ansible
sudo chown -R $USER:sudo /var/log/ansible

echo "$VERSION" > /opt/ansible/madeb12/Version.txt

if [ "$OPTION" = "download" ] ; then
	exit
fi

cd /opt/ansible/madeb12
bash madeb.sh
