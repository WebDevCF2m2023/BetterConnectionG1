# BetterConnectionG1
Un mini site de News en MVC créé par le Groupe 1 WebDev 2024

## Projet en MVC

Ce projet sera réalisé en utilisant le modèle MVC (Modèle-Vue-Contrôleur) pour la gestion des pages et des données.

![MVC](https://raw.githubusercontent.com/WebDevCF2m2023/OneConnectionG2/main/public/img/MVC.png)

## Les jointures
![join](https://raw.githubusercontent.com/WebDevCF2m2023/BetterConnectionG1/main/public/img/sql-joins.jpg)

Avec quelques exemples dans `data/query-2024-03-22.sql`.

## Scripts disponibles

### `uniqid()`

https://onlinephp.io/c/56cfb

### `password_hash()` and `password_verify()`

https://onlinephp.io/c/43199

## Exemples d'articles

Merci au site https://fr.wikipedia.org/wiki/Astronomie pour les exemples d'articles utilisés en développement pendant cet exercice de projet de groupe.

## Utilisateurs de test

### Administrateurs

- `Mikhawa` / `Mikhawa`
- `PierreSandron` / `PierreSandron`
- `Magib` / `Magib`

## Liste de tâches

### EXE1
- Création d'un fichier de configuration `config.php` avec les constantes de connexion à la DB
    - Mise dans le .gitignore
    - Création d'un fichier `config.php.ini`
- Création du contrôleur frontal
    - Import du fichier `config.php`
    - Création d'une connexion PDO avec try catch
    - requête qui séléctionne tous les articles avec les auteurs (si existant)
    - affichage dans une boucle while ou foreach des résultats.