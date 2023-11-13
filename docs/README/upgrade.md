# Mise à niveau madeb11 vers madeb12

Mise à niveau de votre Debian 11 (madeb11) vers Debian 12 (madeb12)  

**Attention** Une mise à jour nécessite beaucoup d'espace.  
Vérifier l'espace disponible sur votre racine “/” avec la commande :  

	df h

## Sauvegarde

Vous devez au préalable sauvegarder vos données (/home) et fichiers de configuration si nécessaire.

Infos utiles :

[https://debian-facile.org/doc:migrer](https://debian-facile.org/doc:migrer)

[https://www.debian.org/News/2023/20230610.fr.html](https://www.debian.org/News/2023/20230610.fr.html) paragraphe "Mise à niveau"


## Script de migration (NON GARANTIE !)

### en automatique :

      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/Divers/xdeb11toxdeb12.sh | bash

### en deux temps :

- Téléchargement du script

      wget https://raw.githubusercontent.com/cpunivangers/madeb12/main/files/Divers/xdeb11toxdeb12.sh

- Redémarrage
- Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**
- Lancer le script :

		bash xdeb11toxdeb12.sh

## Principales opérations réalisées par ce script :

### Préparation

- Suppression des éléments madeb11
- Purge de divers paquets pouvant poser problèmes.
- Téléchargement de madeb12
- Extraction dans /opt/ansible/
- Déplacement des dépôts annexes vers /etc/apt/sources.list.d11
- Mise à jour de la Debian 11
- Nettoyage

### Mise à niveau vers Debian 12

- Mise à jour du sources.list par celui de la Debian 12
- Affichage de l'espace disque nécessaire pour le téléchargement des paquets.
- Mise à jour
- Exécution du playbook **madeb.yml** en local

## Redémarrer le poste

Vous pouvez mettre à jour vos logiciels de dépôts annexes, si nécessaire.

