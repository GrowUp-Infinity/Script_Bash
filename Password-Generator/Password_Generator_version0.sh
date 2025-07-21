#!/bin/bash

#Simple Generator Password

echo "Ceci est un simple script générateur de mots de passe."
echo "Entrez la longueur du mot de passe !"

read PASS_LENGTH

echo "Mot de passe généré : "
for i in $(seq 1 );
do 
     openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done
