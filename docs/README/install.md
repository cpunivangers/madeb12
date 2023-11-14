## Installation madeb12

Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**  

- Faire les mises à jour :

      sudo apt update && sudo apt -y dist-upgrade

- Si ce n'est pas la première installation de **madeb12** et pour une ré-initialisation complète (Firefox, XFCE), supprimer les 2 répertoires :

		rm -rf ~/.mozilla && rm -rf ~/.config/xfce4

- Récupération ansible pour madeb12 et installation madeb (/opt/ansible/madeb12) :

### en automatique :

      sudo apt -y install curl
      curl -sL https://raw.githubusercontent.com/cpunivangers/madeb12/main/playbooks/files/update_madeb12.sh | bash

### ou en deux temps :

- Téléchargement du script :

		wget https://raw.githubusercontent.com/cpunivangers/madeb12/main/playbooks/files/update_madeb12.sh

- Redémarrage
- Se connecter sur le poste en SSH ou en **terminal [CTRL]+[ALT]+[F1]**
- Lancer le script :

		bash update_madeb12.sh

## Principales opérations réalisées par le script :

- Mise à jour Debian
- Création d'un environnement virtuel python3 avec pip et ansible
- Téléchargement de la dernière version madeb12 : 12.aammjj.hhmn.tar.gz [https://github.com/cpunivangers/madeb12/releases/latest](https://github.com/cpunivangers/madeb12/releases/latest)
- Extraction dans /opt/ansible/
- Exécution du playbook **madeb.yml** en local

## Autres opérations possibles :

- Si nécessaire, vous pouvez relancer la configuration **madeb** en tapant dans un terminal :

		madeb

- Mise à jour madeb12 et exécution :

	**madeb12** est régulièrement mise à jour, vous pouvez mettre à jour votre machine en tapant dans un terminal :

		update_madeb