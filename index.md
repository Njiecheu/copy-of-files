# 🚀 Copy-of-files

`copy-of-files` est un utilitaire Bash léger conçu pour automatiser le déploiement de fichiers sur plusieurs machines distantes au sein d'un réseau local. Il est particulièrement utile pour les administrateurs système ou les développeurs travaillant sur des clusters de machines.

## ✨ Fonctionnalités

- **Déploiement en masse** : Cible une plage d'IP dynamique.
- **Vérification de connectivité** : Effectue un `ping` avant chaque tentative de transfert pour éviter les timeouts `scp` inutiles.
- **Flexibilité** : Supporte les arguments en ligne de commande avec des valeurs par défaut intelligentes.
- **Feedback visuel** : Affiche clairement l'état d'avancement du déploiement.

## Getting Started

### Prerequisites

- **SSH/SCP** : Assurez-vous que `openssh-client` est installé localement et que le service SSH tourne sur les machines cibles.
- **Authentification** : Il est fortement recommandé de configurer des clés SSH (`ssh-copy-id`) pour éviter d'avoir à saisir un mot de passe pour chaque machine.
- **Réseau** : Votre machine doit avoir une route active vers la plage d'IP ciblée.

### Configuration

Le script utilise les variables par défaut suivantes dans `copy.sh` :

| Variable | Valeur par défaut | Description |
| :--- | :--- | :--- |
| `FILENAME` | `./client.c` | Le fichier source à copier. |
| `DEST` | `/home/client/Downloads` | Le chemin de destination sur l'hôte distant. |
| `RANGE` | `133..135` | La plage d'adresses IP (suffixe de l'IP `192.168.211.x`). |

### Usage

Vous pouvez lancer le script sans arguments pour utiliser les valeurs par défaut, ou passer des paramètres spécifiques.

**1. Rendre le script exécutable :**

```bash
chmod +x copy.sh
```

**2. Exécution avec les valeurs par défaut :**

```bash
./copy.sh
```