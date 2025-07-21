#!/bin/bash

# ============================
# Advanced Password Generator
# ============================

# Définir le jeu de caractères avec un tableau associatif : [cle]=description:jeu_de_caractères
declare -A CHAR_SETS=(
  [1]="Nombres seulement:0123456789"
  [2]="Lettres seulement:abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  [3]="Lettres + Nombres:abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  [4]="Lettres + Nombres + Symboles:abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+="
  [5]="Lettres + Nombres + Symboles + Accentué:abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+=àâçéèêëîïôùûüÿÀÂÇÉÈÊËÎÏÔÙÛÜŸ"
)

# Forcer l'encodage UTF-8 (important pour les caractères accentués)
export LC_ALL=C.UTF-8

# Affichage automatique du menu interactif
echo "Veuillez choisir le type de caractères pour le(s) mot(s) de passe :"
for cle in "${!CHAR_SETS[@]}"; do
  # extrait le jeu de caractères (avant :)
  desc="${CHAR_SETS[$cle]%%:*}"
  echo "$cle) $desc"
done

# Choix utilisateur
while true; do
  echo -n "Faites votre choix entre 1 à 5 : "
  read CHAR_OPTION
  if [[ -n "${CHAR_SETS[$CHAR_OPTION]}" ]]; then
    # extrait le jeu de caractères (après :)
    CHAR_SET="${CHAR_SETS[$CHAR_OPTION]#*:}"
    break
  else
    echo "Choix invalide ! Veuillez réessayer."
  fi
done

# Demander longueur et nombre de mots de passe
read -p "Entrez la longueur du mot de passe (entre 1 à 30) : " PASS_LENGTH
read -p "Entrez un nombre de mots de passe à générer : " PASS_COUNT

# Longueur du jeu de caractères
CHAR_SET_LENGTH=${#CHAR_SET}

# Fichier de sortie
OUTPUT_FILE="password_generator.txt"
echo "===== Mots de passe générés =====" > "$OUTPUT_FILE"

# Définir la couleur selon l'option choisie
case "$CHAR_OPTION" in
  1) COLOR="\033[1;31m" ;; # Rouge
  2) COLOR="\033[1;33m" ;; # Jaune
  3) COLOR="\033[1;35m" ;; # Violet
  4) COLOR="\033[1;34m" ;; # Bleu
  5) COLOR="\033[1;32m" ;; # Vert
  *) COLOR="\033[0m" ;;     # Blanc par défaut
esac

RESET="\033[0m"  # Reset des couleurs ANSI

# Génération des mots de passe
echo -e "\nMots de passe générés :\n"
for (( i = 0; i < PASS_COUNT; i++ )); do
  PASSWORD=""
  for (( j = 0; j < PASS_LENGTH; j++ )); do
    index=$(( RANDOM % CHAR_SET_LENGTH ))
    PASSWORD+="${CHAR_SET:$index:1}"
  done

  # Affichage coloré
  echo -e "${COLOR}${PASSWORD}${RESET}"

  # Enregistrement dans le fichier
  echo "$PASSWORD" >> "$OUTPUT_FILE"
done

echo -e "\nLes mots de passe ont été enregistrés dans le fichier : ${OUTPUT_FILE}"
