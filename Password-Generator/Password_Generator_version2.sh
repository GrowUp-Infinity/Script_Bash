#!/bin/bash

# Simple Generator Password

echo "Simple script générateur de mot de passe !"

# Lire la longueur du mot de passe
while true;
  do
     echo "Veuillez choisir la longueur du mot de passe entre 1 à 30 caractères : "
     read PASS_LENGTH

 # Vérifie si PASS_LENGTH est un nombre entre 1 et 30
  if [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]] && [[ "$PASS_LENGTH" -ge 1 ]] && [[ "$PASS_LENGTH" -le 30 ]];
  then
       break
  else
      echo "Entrée invalide ! S'il vous plait, mettez un nombre compris  entre 1 et 30."
  fi
done

# Lire le nombre de mot de passe à générer
while true;
  do
     echo "Combien de mots de passe voulez-vous générer entre 1 et 20 ?"
     read PASS_COUNT


# Vérifie si PASS_COUNT  est un nombre entre 1 et 100
  if [[ "$PASS_COUNT" =~ ^[0-9]+$ ]] && [[ "$PASS_COUNT" -ge 1 ]] && [[ "$PASS_COUNT" -le 100 ]];
  then
       break
  else
      echo "Entrée invalide ! S'il vous plait, veuillez choisir un nombre entre 1 et 100"
  fi
done


# Générer les mots de passe
echo "Mots de passe générés : "
for i in $(seq 1 $PASS_COUNT);
  do 
     openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done
