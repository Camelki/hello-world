#!/bin/bash

# Choisissez la commande en fonction de la cible spécifiée
case "$1" in
  "production")
    docker build -t mon_image:production --target production .
    exec docker run mon_image:production
    ;;
  "integration")
    docker build -t mon_image:integration --target integration .
    exec docker run mon_image:integration
    ;;
  "developpement")
    docker build -t mon_image:developpement --target developpement .
    exec docker run mon_image:developpement
    ;;
  *)
    echo "Cible non spécifiée. Utilisation par défaut de la version de production."
    exec docker run mon_image:production
    ;;
esac
