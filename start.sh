#!/bin/bash

# Construire l'image Docker si elle n'existe pas
docker build -t mon_image .

# Lancer le conteneur Docker
docker run mon_image
