#!/bin/bash

# Choisissez la commande en fonction de la cible spécifiée
case "$1" in
  "prod")
    docker build -t mon_image:prod-latest --target prod .
    exec docker run mon_image:prod-latest
    ;;
  "int")
    docker build -t mon_image:int-latest --target int .
    exec docker run mon_image:int-latest
    ;;
  "devel")
    docker build -t mon_image:dev-latest --target devel .
    exec docker run mon_image:dev-latest
    ;;
  *)
    echo "Cible non spécifiée. Utilisation par défaut de la version de production."
    exec docker run mon_image:production
    ;;
esac
