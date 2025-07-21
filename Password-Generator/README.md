# Générateur de mots de passe avancé (Bash)

Ce projet est un ensemble de script bash pour générer des mots de passe aléatoirement. Il regroupé sous différente version, avec des améliorations. 
On a un simple script vers un script Bash interactif qui permet de les générer et personnaliser rapidement selon plusieurs critères (chiffres, lettres, symboles, caractères accentués, etc.). 
La dernière version est simple à utiliser, configurable, et enregistre automatiquement les mots de passe dans un fichier texte.

---

## Fonctionnalités
Version4 :
- Menu interactif en ligne de commande
- Choix du type de caractères utilisés (5 options)
- Prise en charge des caractères accentués (UTF-8)
- Affichage coloré des mots de passe générés
- Sauvegarde automatique dans un fichier `password_generator.txt`

---

## Options disponibles

Lors de l'exécution depuis la version 4, le script propose 5 types de jeux de caractères :

1. ** Nombres seulement ** 
2. ** Lettres seulement ** (majuscules et minuscules) 
3. ** Lettres + Nombres ** 
4. ** Lettres + Nombres + Symboles ** 
5. ** Lettres + Nombres + Symboles + Caractères accentués ** 

---

## Utilisation

### Prérequis

- Système Linux ou MacOS avec Bash
- Terminal compatible UTF-8 (important pour les accents)

###  Exécution

```bash
chmod +x Password_Generator_VersionX.sh
./Password_Generator_VersionX.sh
