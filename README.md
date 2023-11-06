# Ma Debian 12 Xfce

Configuration d'un poste Debian 12 bureau XFCE avec ansible.

## Pré-requis

Installer **Debian-Facile 12.x** ou  Debian 12.x  

### Installation Debian-Facile (Le plus facile !)

Installer Debian-Facile, c'est une vraie Debian avec un bureau XFCE et une pré-configuration qui facilite son utilisation.  

Image iso : [https://debian-facile.org/dflinux/isos/](https://debian-facile.org/dflinux/isos/)

### ou installation de Debian 12

Installation Debian 12 avec l’image **debian-12.n.n-amd64-netinst.iso**  
[https://cdimage.debian.org/debian-cd/current/amd64/iso-cd](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd)

**ATTENTION pour une machine virtuelle Virtualbox, installer en BIOS mode, ne pas activer EFI**

- Pas de mot passe pour root (= mode sudo)
- Mettre Bureau **XFCE** à la place de GNOME
- Ajouter Serveur SSH (si vous voulez installer distance la suite)

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]** 

## Installation madeb12

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Faire les mises à jour :

      sudo apt update && sudo apt -y dist-upgrade

- Si ce n'est pas la première installation de **madeb12** et pour une ré-initialisation complète (Firefox, XFCE), supprimer les 2 répertoires :

		rm -rf ~/.mozilla && rm -rf ~/.config/xfce4

- Récupération ansible pour madeb12 et installation madeb (/opt/ansible/madeb12) :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/update_madeb12.sh | bash

### Principales opérations réalisées par le script :

- Mise à jour Debian
- Création d'un environnement virtuel python3 avec pip et ansible
- Téléchargement de la dernière version madeb12 : 12.aammjj.hhmn.tar.gz [https://github.com/cpunivangers/madeb12/releases/latest](https://github.com/cpunivangers/madeb12/releases/latest)
- Extraction dans /opt/ansible/
- Exécution du playbook **madeb.yml** en local

## Mise à niveau madeb11 vers madeb12

Mise à niveau de votre Debian 11 (madeb11) vers Debian 12 (madeb12)  

**Attention** Une mise à jour nécessite beaucoup d'espace.  
Vérifier l'espace disponible sur votre racine “/” avec la commande :  

	df h

### Sauvegarde

Vous devez au préalable sauvegarder vos données (/home) et fichiers de configuration si nécessaire.

Infos utiles :

[https://debian-facile.org/doc:migrer](https://debian-facile.org/doc:migrer)

[https://www.debian.org/News/2023/20230610.fr.html](https://www.debian.org/News/2023/20230610.fr.html) paragraphe "Mise à niveau"


### Script de migration (NON GARANTIE !)

#### en automatique
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/Divers/xdeb11toxdeb12.sh | bash

#### en deux temps :

- Téléchargement du script

      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/Divers/xdeb11toxdeb12.sh > xdeb11toxdeb12.sh

- Redémarrage :
- Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**
- Lancer le script :

		bash xdeb11toxdeb12.sh

### Principales opérations réalisées par ce script :

#### Préparation

- Suppression des éléments madeb11
- Purge de divers paquets pouvant poser problèmes.
- Téléchargement de madeb12
- Extraction dans /opt/ansible/
- Déplacement des dépôts annexes vers /etc/apt/sources.list.d11
- Mise à jour de la Debian 11
- Nettoyage

#### Mise à niveau vers Debian 12

- Mise à jour du sources.list par celui de la Debian 12
- Affichage de l'espace disque nécessaire pour le téléchargement des paquets.
- Mise à jour
- Exécution du playbook **madeb.yml** en local

### Redémarrer le poste

Vous pouvez mettre à jour vos logiciels de dépôts annexes, si nécessaire.

<!---
## ou Installation mini

Configuration minimum XFCE plus quelques outils (machines pour TP Linux)

Faire l'installation de la Debian 12 comme précédemment.

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Récupération ansible (/opt/ansible/madeb12) :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/minideb12.sh | bash

--->
