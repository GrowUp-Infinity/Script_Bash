#!/bin/bash

# Simple Generator Password

echo "Ceci est un simple générateur de mot de passe avec des lettres limitées !"

# Boucle jusqu'à ce que la saisie soit correcte
while true;
  do
     echo "Entrez une longueur du mot de passe entre 1 et 30 : "
     read PASS_LENGTH

# Vérifie si PASS_LENGTH est un nombre entre 1 et 30
  if [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]] && [[ "$PASS_LENGTH" -ge 1 ]] && [[ "$PASS_LENGTH" -le 30 ]];
  then
       break
  else
      echo "Entrée invalide ! Veuillez choisir un nombre entre 1 et 30."
  fi
done

# Génère 1 seul mot de passe
echo "Mot de passe généré : "
for i in $(seq 1 );
  do 
     openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done

