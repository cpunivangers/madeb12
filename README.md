# Ma Debian 12 Xfce

Configuration d'un poste Debian 12 bureau XFCE avec ansible.

## Pré-requis

Installer **Debian-Facile 12.x** ou  Debian 12.x  

### Installation Debian-Facile (Le plus facile !)

Installer Debian-Facile, c'est une vraie Debian avec un bureau XFCE et une pré-configuration qui facilite son utilisation.  

Image iso : https://debian-facile.org/dflinux/isos/

### ou installation de Debian 12

Installation Debian 12 avec l’image **debian-12.n.n-amd64-netinst.iso**  
[https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso)

**ATTENTION pour une machine virtuelle Virtualbox, installer en BIOS mode, ne pas activer EFI**

- Pas de mot passe pour root (= mode sudo)
- Mettre Bureau **XFCE** à la place de GNOME
- Ajouter Serveur SSH (si vous voulez installer distance la suite)

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]** 

## Installation madeb12 complète

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Faire les mises à jour :

      sudo apt update && sudo apt -y dist-upgrade

- Pour une ré-initialisation complète, supprimer les 2 répertoires :

		rm -rf ~/.mozilla && rm -rf ~/.config/xfce4

- Récupération ansible pour madeb et installation (/opt/ansible/madeb12) :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/update_madeb12.sh | bash

## ou Installation mini

Configuration minimum XFCE plus quelques outils (machines pour TP Linux)

Faire l'installation de la Debian 12 comme précédemment.

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Récupération ansible (/opt/ansible/madeb12) :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/minideb12.sh | bash
