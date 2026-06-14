# **Généralités sur le Scripting Bash**

Bash (Bourne Again SHell) est l'interface textuelle la plus répandue sur les systèmes Unix et Linux. Au-delà d'un simple interpréteur de commandes, c'est un langage de programmation complet pour l'automatisation.

## **Pourquoi utiliser Bash ?**

- **Automatisation** : Exécuter des tâches répétitives sans intervention humaine.
- **Portabilité** : Présent nativement sur presque tous les serveurs Linux.
- **Puissance** : Permet de manipuler des fichiers, des processus et des flux réseau facilement.

## **Concepts Fondamentaux**

### **1. Syntaxe et Variables**
En Bash, l'assignation ne supporte pas d'espaces : `NAME="Utilisateur"`. Pour accéder à la valeur, on utilise le symbole `$` : `echo $NAME`.

### **2. Les Flux (IO Redirection)**
- `>` : Redirige la sortie vers un fichier (écrase).
- `>>` : Ajoute la sortie à la fin d'un fichier.
- `2>&1` : Redirige les erreurs vers la sortie standard.

### **3. Structures de Contrôle**
- **Conditions** : `if [ condition ]; then ... fi`
- **Boucles** : `for item in list; do ... done`

## **Gestion des Erreurs**
Chaque commande renvoie un *Exit Status* (de 0 à 255).
- `0` signifie que tout s'est bien passé.
- Une valeur différente de `0` indique une erreur spécifique.

## **Exemple Pratique**

Voici un script simple qui regroupe ces concepts (création d'un dossier de log et de fichiers temporaires) :

```bash
#!/bin/bash

# 1. Définition de variables
BACKUP_DIR="./ma_sauvegarde"
LOG_FILE="rapport.log"

# 2. Test et création de dossier (Condition & Redirection)
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Initialisation : création du dossier..." > "$LOG_FILE"
    mkdir "$BACKUP_DIR"
fi

# 3. Boucle pour créer des fichiers (Boucle & Redirection d'ajout)
for i in {1..3}; do
    echo "Génération du fichier de données $i" >> "$LOG_FILE"
    touch "$BACKUP_DIR/donnee_$i.tmp"
done

# 4. Vérification du code de retour (Gestion des erreurs)
if [ $? -eq 0 ]; then
    echo "Opération terminée avec succès. Consultez $LOG_FILE"
fi
```

---

*Cette documentation sert de base pour comprendre le fonctionnement de nos outils. Pour voir une application concrète, consultez l'[Introduction au projet Copy-of-files](introduction.md).*